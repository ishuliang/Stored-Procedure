
ALTER PROCEDURE dbo.usp_yjjk_yjjgfb
(
    @syscode  VARCHAR(100) = NULL,      -- 系统代码：'RIS'、'LIS'
    @cflb     VARCHAR(100) = NULL,      -- 病人类型：0门诊 1住院 3体检
    @patid    VARCHAR(100) = NULL,      -- 病人唯一标识（必传）
    @cfxh     VARCHAR(100) = NULL,      -- 处方序号（RIS=LIS共用）
    @xmlbdm   VARCHAR(100) = NULL,      -- 报告类型代码
    @xmlbmc   VARCHAR(100) = NULL,      -- 报告类型名称
    @xmdm     VARCHAR(100) = NULL,      -- 项目代码（必传）
    @xmmc     VARCHAR(500) = NULL,      -- 项目名称
    @xmjg     VARCHAR(MAX) = NULL,      -- 项目结果（必传）
    @ksdm     VARCHAR(100) = NULL,      -- 检验科室代码
    @ysdm     VARCHAR(100) = NULL,      -- 检验医生代码
    @wcsj     VARCHAR(100) = NULL,     -- 完成时间（报告时间）
    @xmdw     VARCHAR(100) = NULL,      -- 项目单位
    @jglx     VARCHAR(100) = NULL,      -- 结果类型
    @jgckz    VARCHAR(100) = NULL,      -- 参考值
    @gdbz     VARCHAR(100) = NULL,      -- 高低标志
    @dyxh     VARCHAR(100) = NULL,      -- 打印序号
    @applyno  VARCHAR(100) = NULL,      -- 报告单号（必传）
    @crbz     INT          = NULL      -- 传染标志
)
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE 
        @ErrorMsg VARCHAR(MAX) = NULL,    -- 完整错误信息
        @ReturnRows INT = 0,
        @Success BIT = 1;                 -- 执行是否成功（1成功，0失败）



    SELECT 'T' AS BZ, '' AS errmsg

    -- ==================== 统一写入全局日志表 ====================
      -- 写入日志
    EXEC dbo.usp_sys_WriteInterfaceLog 
        @ProcName = 'usp_yjjk_yjjgfb', 
        @Params = NULL, 
        @Success = @Success, 
        @ReturnRows = ReturnRows, 
        @ErrorMsg = @ErrorMsg;

END
GO

PRINT '存储过程 usp_yjjk_yjjgfb 已升级完成！'