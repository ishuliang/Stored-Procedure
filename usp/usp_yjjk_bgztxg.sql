ALTER PROCEDURE dbo.usp_yjjk_bgztxg
(
    @brlb       VARCHAR(2)   = NULL,  -- 病人类别
    @patid      VARCHAR(100) = NULL,  -- 病人唯一标识
    @curno      VARCHAR(100) = NULL,  -- 病人就诊流水号
    @ysdm       VARCHAR(100) = NULL,  -- 报告医生工号
    @bgzt       VARCHAR(10)  = NULL,  -- 报告状态
    @txzt       VARCHAR(10)  = NULL,  -- 图像状态
    @jczt       VARCHAR(100) = NULL,  -- 检查状态 20签收——对应贾维斯的登记，30入库，40初审，50终审，60发布——对应贾维斯的出报告
    @bgdh       VARCHAR(100) = NULL,  -- 报告单号
    @bglx       VARCHAR(100) = NULL,  -- 报告类型
    @logno      VARCHAR(100) = NULL,  -- 明细序号集合
    @lis        VARCHAR(16)  = NULL,  -- 系统代码
    @txm        VARCHAR(100) = NULL   -- 条形码
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
    INSERT INTO dbo.usp_yjjk_bgztxg_log (brlb, patid, curno, ysdm, bgzt, txzt, jczt, bgdh, bglx, logno, lis, txm)
    VALUES (@brlb, @patid, @curno, @ysdm, @bgzt, @txzt, @jczt, @bgdh, @bglx, @logno, @lis, @txm);
    SET @LogId = SCOPE_IDENTITY();

    BEGIN TRY
        -- 基础校验
        IF @brlb IS NULL OR LTRIM(RTRIM(@brlb)) = ''
            RAISERROR('病人类别不能为空！', 16, 1)
        IF ISNUMERIC(@brlb) = 0
            RAISERROR('病人类别必须为数字！传入值：%s', 16, 1, @brlb)
        SET @brlb_int = CAST(@brlb AS INT)
        IF @brlb_int <> 3
            RAISERROR('病人类别不正确！必须为3（体检）', 16, 1)

        IF ISNULL(@bgdh, '')  = ''
            RAISERROR('报告单号不能为空', 16, 1)

        -- 报告状态校验
        IF @jczt IS NULL OR LTRIM(RTRIM(@jczt)) = ''
            RAISERROR(N'检查状态(@jczt)不能为空', 16, 1);
        IF ISNUMERIC(@jczt) = 0
            RAISERROR(N'检查状态(@jczt)必须为数字！传入值：%s', 16, 1, @jczt)

        -- ==================== 业务处理：插入逻辑（无修改） ====================
        IF @jczt = 20
        BEGIN
            -- LIS 系统：按 bar_code 防重
            IF UPPER(@lis) = 'LIS'
            BEGIN
                IF @txm IS NULL OR LTRIM(RTRIM(@txm)) = ''
                    RAISERROR(N'LIS系统登记时条形码(@txm)不能为空', 16, 1);
                IF EXISTS (SELECT 1 FROM dbo.interface_state  WHERE bar_code = @txm )
                    RAISERROR(N'该条形码 %s 已存在签收记录，请勿重复插入', 16, 1, @txm);
					
				INSERT INTO dbo.interface_state (patient_code,state,state_name,update_time,bar_code,param_type,service_provider_type,report_no)
				VALUES (
					@patid,0,N'登记',GETDATE(),
                    @txm,
                    '3',
                    @lis,@bgdh
				);
            END
            ELSE
            BEGIN
                -- 非LIS系统：按 apply_no + patient_code 防重
                IF EXISTS (SELECT 1  FROM dbo.interface_state  WHERE apply_no = @bgdh  AND patient_code = @patid)
                    RAISERROR(N'该报告单号 %s + 患者编码 %s 已存在登记记录，请勿重复插入', 16, 1, @bgdh, @patid);
            END
            
            
        END

        -- ==================== 核心修改：更新逻辑（按@lis区分条件） ====================
        ELSE IF @jczt = 60
        BEGIN
            -- 1. LIS系统：按bar_code更新，且必须传txm
            IF UPPER(@lis) = 'LIS'
            BEGIN
                IF @txm IS NULL OR LTRIM(RTRIM(@txm)) = ''
                    RAISERROR(N'LIS系统更新时条形码(@txm)不能为空', 16, 1);
                
                -- 按bar_code更新记录
                UPDATE dbo.interface_state
                SET 
                    state       = 1,
                    state_name  = N'已审核',
                    update_time = GETDATE(),
                    param_type  = '3'  -- LIS系统固定param_type为3
                WHERE 
                    bar_code = @txm;

                SET @UpdateCount = @@ROWCOUNT;
                IF @UpdateCount = 0
                    RAISERROR(N'LIS系统更新失败：未找到条形码为 %s 的记录', 16, 1, @txm);
            END
            -- 2. 非LIS系统：按apply_no + patient_code更新
            ELSE
            BEGIN
                IF @patid IS NULL OR LTRIM(RTRIM(@patid)) = ''
                    RAISERROR(N'非LIS系统更新时患者编码(@patid)不能为空', 16, 1);
                
                -- 按apply_no + patient_code更新记录
                UPDATE dbo.interface_state
                SET 
                    state       = 1,
                    state_name  = N'已审核',
                    update_time = GETDATE(),
                    param_type  = NULL  -- 非LIS系统param_type置空
                WHERE 
                    apply_no = @bgdh 
                    AND patient_code = @patid;

                SET @UpdateCount = @@ROWCOUNT;
                IF @UpdateCount = 0
                    RAISERROR(N'非LIS系统更新失败：未找到报告单号 %s + 患者编码 %s 的记录', 16, 1, @bgdh, @patid);
            END
        END

        SELECT 'T' AS BZ, '' AS errmsg;
    END TRY
    BEGIN CATCH
        SET @Success = 0
        SET @ErrorMsg = ERROR_MESSAGE()
        SELECT 'F' AS BZ, @ErrorMsg AS errmsg
    END CATCH

    -- 更新日志记录结果
    UPDATE dbo.usp_yjjk_bgztxg_log 
    SET result = CASE WHEN @Success = 1 THEN '200' ELSE '-1' END,
        errormessage = CASE WHEN @Success = 1 THEN 'success' ELSE @ErrorMsg END
    WHERE id = @LogId;
END
GO

PRINT '存储过程 usp_yjjk_bgztxg 创建成功！'