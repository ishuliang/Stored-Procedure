-- 检查报告发布
ALTER PROCEDURE dbo.up_interface_RIS_WN_jcbgfb
(   
    @xml VARCHAR(MAX) = NULL,
    @idoc  VARCHAR(100) = NULL,      
    @iDiagnoseid     VARCHAR(100) = NULL,      
    @bw    VARCHAR(100) = NULL,     
    @jcjl     VARCHAR(100) = NULL,      
    @jcsj   VARCHAR(100) = NULL,      
    @cCheckType   VARCHAR(100) = NULL,      
    @cPatientName     VARCHAR(100) = NULL,    
    @cReportCode     VARCHAR(500) = NULL,    
    @cSendDept     VARCHAR(MAX) = NULL,      
    @cSendDoctor     VARCHAR(100) = NULL,      
    @cPatientCode     VARCHAR(100) = NULL,   
    @sex     VARCHAR(100) = NULL,    
    @cCheckDept     VARCHAR(100) = NULL,     
    @cCheckDoctor     VARCHAR(100) = NULL,   
    @cBillCode    VARCHAR(100) = NULL,    
    @dReportDate     VARCHAR(100) = NULL,    
    @errorMeg     VARCHAR(100) = NULL     
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE 
        @LogId    INT = 0,
        @ErrorMsg VARCHAR(MAX) = NULL,    -- 完整错误信息
        @ReturnRows INT = 0,
        @Success BIT = 1;                 -- 执行是否成功（1成功，0失败）
    
    -- 插入日志记录
    INSERT INTO dbo.up_interface_RIS_WN_jcbgfb_log (idoc, iDiagnoseid, bw, jcjl, jcsj, cCheckType, cPatientName, cReportCode, cSendDept, cSendDoctor, cPatientCode, sex, cCheckDept, cCheckDoctor, cBillCode, dReportDate, errorMeg)
    VALUES (@idoc, @iDiagnoseid, @bw, @jcjl, @jcsj, @cCheckType, @cPatientName, @cReportCode, @cSendDept, @cSendDoctor, @cPatientCode, @sex, @cCheckDept, @cCheckDoctor, @cBillCode, @dReportDate, @errorMeg);
    SET @LogId = SCOPE_IDENTITY();

    SELECT 'T' AS Code, '' AS errmsg;


    -- 更新日志记录结果
    UPDATE dbo.up_interface_RIS_WN_jcbgfb_log 
    SET result = CASE WHEN @Success = 1 THEN '200' ELSE '-1' END,
        errormessage = CASE WHEN @Success = 1 THEN 'success' ELSE @ErrorMsg END
    WHERE id = @LogId;

END
GO

PRINT '存储过程 up_interface_RIS_WN_jcbgfb 已升级完成！'
