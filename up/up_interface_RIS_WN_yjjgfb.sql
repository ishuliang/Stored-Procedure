ALTER PROCEDURE dbo.up_interface_RIS_WN_yjjgfb
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
    @crbz     VARCHAR(100) = NULL      -- 传染标志
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
    INSERT INTO dbo.up_interface_RIS_WN_yjjgfb_log (syscode, cflb, patid, cfxh, xmlbdm, xmlbmc, xmdm, xmmc, xmjg, ksdm, ysdm, wcsj, xmdw, jglx, jgckz, gdbz, dyxh, applyno, crbz)
    VALUES (@syscode, @cflb, @patid, @cfxh, @xmlbdm, @xmlbmc, @xmdm, @xmmc, @xmjg, @ksdm, @ysdm, @wcsj, @xmdw, @jglx, @jgckz, @gdbz, @dyxh, @applyno, @crbz);
    SET @LogId = SCOPE_IDENTITY();

    BEGIN TRY
        -- ==================== 直接插入数据到ReportData表 ====================
        DELETE FROM ReportData WHERE applyno = @applyno AND xmdm = @xmdm;
        
        INSERT INTO ReportData (
            syscode, cflb, patid, cfxh, xmlbdm, xmlbmc,
            xmdm, xmmc, xmjg, ksdm, ysdm, wcsj,
            xmdw, jglx, jgckz, gdbz, dyxh, applyno, crbz
        )
        VALUES (
            @syscode, @cflb, @patid, @cfxh, @xmlbdm, @xmlbmc,
            @xmdm, @xmmc, @xmjg, @ksdm, @ysdm, @wcsj,
            @xmdw, @jglx, @jgckz, @gdbz, @dyxh, @applyno, @crbz
        );

        -- 获取插入的行数
        SET @ReturnRows = @@ROWCOUNT;

        -- 返回成功标识和空错误信息
        SELECT 'T' AS BZ, '' AS errmsg;

    END TRY
    BEGIN CATCH
        SET @Success = 0
        SET @ErrorMsg = ERROR_MESSAGE()
        -- 返回失败标识和错误信息
        SELECT 'F' AS BZ, @ErrorMsg AS errmsg;
    END CATCH

    -- 更新日志记录结果
    UPDATE dbo.up_interface_RIS_WN_yjjgfb_log 
    SET result = CASE WHEN @Success = 1 THEN '200' ELSE '-1' END,
        errormessage = CASE WHEN @Success = 1 THEN 'success' ELSE @ErrorMsg END
    WHERE id = @LogId;

END
GO

PRINT '存储过程 up_interface_RIS_WN_yjjgfb 已升级完成！'
