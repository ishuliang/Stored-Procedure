ALTER PROCEDURE dbo.up_interface_RIS_WN_bgztxg
(
    @Brlb       VARCHAR(2)   = NULL,  -- 病人类别
    @PatientID      VARCHAR(100) = NULL,  -- 病人唯一标识
    @CureNo      VARCHAR(100) = NULL,  -- 病人就诊流水号
    @ysdm       VARCHAR(100) = NULL,  -- 报告医生工号
    @bgzt       VARCHAR(10)  = NULL,  -- 报告状态
    @txzt       VARCHAR(10)  = NULL,  -- 图像状态
    @jczt       VARCHAR(100) = NULL,  -- 检查状态 20签收——对应贾维斯的登记，30入库，40初审，50终审，60发布——对应贾维斯的出报告
    @bgdh       VARCHAR(100) = NULL,  -- 报告单号
    @bglx       VARCHAR(100) = NULL,  -- 报告类型
    @logno      VARCHAR(100) = NULL,  -- 明细序号集合
    @syscode        VARCHAR(16)  = NULL  -- 系统代码
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE 
        @LogId       INT = 0,
        @Success     BIT  = 1,
        @ErrorMsg    NVARCHAR(1000) = NULL,
        @bgzt_int    INT = NULL,
        @brlb_int    INT = NULL,
        @UpdateCount INT = 0  -- 新增：记录更新行数

    -- 插入日志记录
    INSERT INTO dbo.up_interface_RIS_WN_bgztxg_log (Brlb, PatientID, CureNo, ysdm, bgzt, txzt, jczt, bgdh, bglx, logno, syscode)
    VALUES (@Brlb, @PatientID, @CureNo, @ysdm, @bgzt, @txzt, @jczt, @bgdh, @bglx, @logno, @syscode);
    SET @LogId = SCOPE_IDENTITY();

    BEGIN TRY
        -- 基础校验
            IF @Brlb IS NULL OR (@Brlb <> 2)
            RAISERROR('病人类别不正确！超声检查为2', 16, 1)

        IF ISNULL(@bgdh, '')  = ''
            RAISERROR('报告单号不能为空', 16, 1)

        -- 报告状态校验
        
        IF ISNULL(@jczt, '') = ''
            RAISERROR(N'检查状态(@jczt)不能为空', 16, 1);


        -- ==================== 业务处理：插入逻辑（无修改） ====================
        IF @jczt = 20
        BEGIN
            -- LIS 系统：按 bar_code 防重
            IF UPPER(@syscode) = 'Ris'
            BEGIN
            
                IF NOT EXISTS (SELECT 1 FROM dbo.interface_state  WHERE report_no = @bgdh and patient_code = @PatientID )
                    RAISERROR(N'该报告单号未确认!', 16, 1, @bgdh);
				UPDATE dbo.interface_state
                SET 
                    state       = 0,
                    state_name  = N'登记',
                    update_time = GETDATE(),
                    service_provider_type = 'WN',
                    param_type  = '2'  -- LIS系统固定param_type为3
                WHERE 
                    report_no = @bgdh and patient_code = @PatientID;
				
            END
            ELSE
            BEGIN
                RAISERROR(N'无法处理该报告单号 %s + 患者编码 %s', 16, 1, @bgdh, @PatientID);
            
            END
            
        END
        -- ==================== 核心修改：更新逻辑（按@lis区分条件） ====================
        ELSE IF @jczt = 60
        BEGIN
        
            IF UPPER(@syscode) = 'Ris'
            BEGIN
                IF NOT EXISTS (SELECT 1 FROM dbo.interface_state  WHERE report_no = @bgdh and patient_code = @PatientID )
                    RAISERROR(N'该报告单号不存在!', 16, 1, @bgdh);
                
                UPDATE dbo.interface_state
                SET 
                    state       = 1,
                    state_name  = N'已审核',
                    update_time = GETDATE(),
                    param_type  = '3'  -- LIS系统固定param_type为3
                WHERE 
                    report_no = @bgdh and patient_code = @PatientID;

                SET @UpdateCount = @@ROWCOUNT;
                IF @UpdateCount = 0
                    RAISERROR(N'LIS系统更新失败：未找到报告单号为 %s 的记录', 16, 1, @bgdh);
            END
            -- 2. 非LIS系统：按apply_no + patient_code更新
            ELSE
            BEGIN
                    RAISERROR(N'非LIS系统更新失败：未找到报告单号 %s + 患者编码 %s 的记录', 16, 1, @bgdh, @PatientID);
            END
        END
        SELECT 'T' AS Code, '' AS errmsg;
    END TRY
    BEGIN CATCH
        SET @Success = 0
        SET @ErrorMsg = ERROR_MESSAGE()
        SELECT 'F' AS Code, @ErrorMsg AS errmsg
    END CATCH

    -- 更新日志记录结果
    UPDATE dbo.up_interface_RIS_WN_bgztxg_log 
    SET result = CASE WHEN @Success = 1 THEN '200' ELSE '-1' END,
        errormessage = CASE WHEN @Success = 1 THEN 'success' ELSE @ErrorMsg END
    WHERE id = @LogId;
END
GO

PRINT '存储过程 up_interface_RIS_WN_bgztxg 创建成功！'