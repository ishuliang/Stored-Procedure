/*--------------------------------------------------------------------------------------
<描述>： 医技确认：登记、取消登记
<测试>： exec up_interface_RIS_WN_yjqr '2','26031300001','26031300001','024','001','170','0','80000000170','1','900730'	,'106','1','1','0','2142254'
<测试>： exec up_interface_RIS_WN_yjqr '2','26031300001','26031300001','024','001','170','0','80000000170','1','900730'	,'106','1','3','0','2142254'
<日志>： select * from up_interface_RIS_WN_yjqr_log order by create_time desc
--------------------------------------------------------------------------------------*/   
ALTER PROCEDURE dbo.up_interface_RIS_WN_yjqr
(
    @Brlb     VARCHAR(100) = NULL,   -- 病人类别（固定传3）
    @PatientID    VARCHAR(100) = NULL,   -- 病人唯一标识
    @cureno    VARCHAR(100) = NULL,   -- 就诊流水号
    @zxksdm   VARCHAR(100) = NULL,   -- 执行科室代码
    @zxysdm   VARCHAR(100) = NULL,   -- 执行医生代码
    @logno    VARCHAR(100) = NULL,   -- 医嘱唯一序号
    @applyno  VARCHAR(100) = NULL,
    @groupno  VARCHAR(100) = NULL,
    @xmdm   VARCHAR(100) = NULL,
    @xmdj     VARCHAR(100) = NULL,
    @xmsl     VARCHAR(100) =  NULL,
    @xmlb     VARCHAR(100) = NULL,
    @xmstatus VARCHAR(100) = NULL,   -- 0不处理 1确认 2拒绝 3撤销
    @sfflag   VARCHAR(100) = NULL,
    @bgdh     VARCHAR(100) = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE 
        @LogId    INT = 0,
        @ErrorMsg VARCHAR(MAX) = NULL,    -- 完整错误信息
        @ReturnRows INT = 0,
        @Success BIT = 1;                 -- 执行是否成功（1成功，0失败）
    
    IF ISNULL(@bgdh, '') = ''  PRINT '报告单号不能为空'

    -- 插入日志记录
    INSERT INTO dbo.up_interface_RIS_WN_yjqr_log (Brlb, PatientID, cureno, zxksdm, zxysdm, logno, applyno, groupno, xmlb, xmdm, xmdj, xmsl, xmstatus, sfflag, bgdh)
    VALUES (@Brlb, @PatientID, @cureno, @zxksdm, @zxysdm, @logno, @applyno, @groupno, @xmlb, @xmdm, @xmdj, @xmsl, @xmstatus, @sfflag, @bgdh);
    SET @LogId = SCOPE_IDENTITY();

    IF NOT EXISTS (SELECT 1 FROM dbo.interface_state  WHERE apply_no = @groupno and patient_code = @PatientID)
    BEGIN
        INSERT INTO dbo.interface_state 
            (patient_code,update_time,apply_no,report_no,state)
				VALUES (
					@PatientID,
                    GETDATE(),
                    @groupno,
                    @bgdh,
                    -1
				);
    END

    IF @xmstatus = '1'  
    BEGIN
        UPDATE dbo.interface_state
                SET 
                    state       = 0,
                    state_name  = N'登记',
                    update_time = GETDATE(),
                    service_provider_type = 'WN',
                    param_type  = '2'  ,
                    report_no   = @bgdh
                WHERE 
                    apply_no = @groupno and patient_code = @PatientID;
    END
    
    IF @xmstatus = '3'  
    BEGIN
        UPDATE dbo.interface_state
                SET 
                    state       = 2,
                    state_name  = N'取消登记',
                    update_time = GETDATE(),
                    param_type  = '2'  ,
                    report_no   = @bgdh
                WHERE 
                    apply_no = @groupno and patient_code = @PatientID;
    END
    


    

    SELECT 'T' AS Code, '' AS errmsg

    -- 更新日志记录结果
    UPDATE dbo.up_interface_RIS_WN_yjqr_log 
    SET result = CASE WHEN @Success = 1 THEN '200' ELSE '-1' END,
        errormessage = CASE WHEN @Success = 1 THEN 'success' ELSE @ErrorMsg END
    WHERE id = @LogId;

END
GO

PRINT '存储过程 up_interface_RIS_WN_yjqr 已升级完成！'