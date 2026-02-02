USE [HEMS_V5]
GO

-- =============================================
-- 医技确认执行病人收费项目
-- =============================================
IF OBJECT_ID('dbo.usp_yjjk_yjqr_sx', 'P') IS NOT NULL
    DROP PROCEDURE dbo.usp_yjjk_yjqr_sx
GO

CREATE PROCEDURE dbo.usp_yjjk_yjqr_sx
(
    @brlb     VARCHAR(100) = NULL,   -- 病人类别（固定传3）
    @patid    VARCHAR(100) = NULL,   -- 病人唯一标识
    @curno    VARCHAR(100) = NULL,   -- 就诊流水号
    @zxksdm   VARCHAR(100) = NULL,   -- 执行科室代码
    @zxysdm   VARCHAR(100) = NULL,   -- 执行医生代码
    @logno    VARCHAR(100) = NULL,   -- 医嘱唯一序号
    @applyno  VARCHAR(100) = NULL,
    @groupno  VARCHAR(100) = NULL,
    @xmlb     VARCHAR(100) = NULL,
    @xmdm     VARCHAR(100) = NULL,
    @xmdj     VARCHAR(100) = NULL,
    @xmsl     VARCHAR(100) =  NULL,
    @xmstatus VARCHAR(100) = NULL,   -- 0不处理 1确认 2拒绝 3撤销
    @sfflag   VARCHAR(100) = NULL,
    @bgdh     VARCHAR(100) = NULL,   -- 报告单号
    @bglx     VARCHAR(100) = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE 
        @Success     BIT  = 1,
        @Rows        INT  = 0,
        @ErrorMsg    NVARCHAR(MAX) = NULL,
        @isLisOrPacs NVARCHAR(4)   =  '2',
        @state       NVARCHAR(4)   =   '',
        @state_name NVARCHAR(50)   =   ''

    BEGIN TRY

        -- ==================== 参数必填校验 ====================
        IF ISNULL(@brlb,'') <> '3'
            RAISERROR('brlb 传入病人类别不正确！必须为3', 16, 1)

        -- IF ISNULL(LTRIM(RTRIM(@patid)),'') = ''
        --     RAISERROR('patid 病人唯一标识不能为空！', 16, 1)
            
        IF ISNULL(LTRIM(RTRIM(@bgdh)),'') = ''
            RAISERROR('bgdh 报告单号不能为空！', 16, 1)
        -- 校验更严谨
        IF ISNULL(@xmstatus, '') NOT IN ('0','1','2','3')
            RAISERROR('xmstatus 项目状态不正确！仅支持 0,1,2,3', 16, 1)

        -- ==================== 业务校验 ====================
        -- IF EXISTS(SELECT 1 FROM VocaPatient WHERE IS_State >= 5 AND PatientCode = @patid)
        --     RAISERROR('体检系统已开始总检,不能确认!如需修改请电话联系体检中心!', 16, 1)

        -- IF NOT EXISTS(
        --     SELECT 1 FROM VocaPatient vp
        --     INNER JOIN VocaPatientFeeItem vpfi ON vp.ID_Patient = vpfi.ID_Patient
        --     WHERE vp.PatientCode = @patid AND vpfi.ID_PatientFeeItem = CAST(@logno AS INT)
        -- )
        --     RAISERROR('logno 值未知，在体软中没有找到该病人数据！', 16, 1)

        -- ==================== 业务处理（这里是你原来的确认逻辑）===================
        -- 登记、取消登记查表，这里应该与报告单号来关联
        -- 0不处理1确认2拒绝3撤销(增加撤销处理)
        IF @xmstatus = 1
            BEGIN
                set @state = '0'
                set @state_name = '登记'
            END
        ELSE IF @xmstatus = 3
            BEGIN
                set @state = '2'
                SET @state_name = '撤销'
            END

        IF ISNULL(LTRIM(RTRIM(@state)),'') <> ''
            MERGE INTO dbo.interface_state AS target
                USING (SELECT @patid AS patient_code, @bgdh AS apply_no) AS source
                    ON target.apply_no   = source.apply_no
                
                WHEN MATCHED THEN
                    UPDATE SET  state = @state,
                                state_name = @state_name,
                                update_time = GETDATE()
                WHEN NOT MATCHED THEN
                    INSERT (patient_code, apply_no, state,state_name, update_time)
                    VALUES (@patid, @bgdh,  @state,@state_name, GETDATE());

        SELECT 'T' AS BZ, '' AS errmsg

    END TRY
    BEGIN CATCH
        SET @Success = 0
        SET @ErrorMsg = ERROR_MESSAGE()

        SELECT 'F' AS BZ, @ErrorMsg AS errmsg

    END CATCH

    -- ==================== 统一写入日志表（所有接口共用）===================
    EXEC dbo.usp_sys_WriteInterfaceLog 
        @ProcName = 'usp_yjjk_yjqr', 
        @ParamNames = '@brlb,@patid,@curno,@zxksdm,@zxysdm,@logno,@applyno,@groupno,@xmlb,@xmdm,@xmdj,@xmsl,@xmstatus,@sfflag,@bgdh,@bglx',
        @ParamValues = CONCAT(@brlb,',',@patid,',',@curno,',',@zxksdm,',',@zxysdm,',',@logno,',',@applyno,',',@groupno,',',@xmlb,',',@xmdm,',',@xmdj,',',@xmsl,',',@xmstatus,',',@sfflag,',',@bgdh,',',@bglx),
        @Success = @Success, 
        @ReturnRows = @Rows, 
        @ErrorMsg = @ErrorMsg;

END
GO

PRINT '存储过程 usp_yjjk_yjqr 已升级完成！'