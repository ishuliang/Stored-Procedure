
ALTER PROCEDURE dbo.usp_yjjk_yjqr
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
        @ErrorMsg VARCHAR(MAX) = NULL,    -- 完整错误信息
        @ReturnRows INT = 0,
        @Success BIT = 1;                 -- 执行是否成功（1成功，0失败）



    SELECT 'T' AS BZ, '' AS errmsg
    -- ==================== 统一写入日志表（所有接口共用）===================
    -- 写入日志
    EXEC dbo.usp_sys_WriteInterfaceLog 
        @ProcName = 'usp_yjjk_yjqr', 
        @Params = NULL, 
        @Success = @Success, 
        @ReturnRows = ReturnRows, 
        @ErrorMsg = @ErrorMsg;

END
GO

PRINT '存储过程 usp_yjjk_yjqr 已升级完成！'