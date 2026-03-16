
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
        @LogId    INT = 0,
        @ErrorMsg VARCHAR(MAX) = NULL,    -- 完整错误信息
        @ReturnRows INT = 0,
        @Success BIT = 1;                 -- 执行是否成功（1成功，0失败）

    -- 插入日志记录
    INSERT INTO dbo.usp_yjjk_yjqr_log (brlb, patid, curno, zxksdm, zxysdm, logno, applyno, groupno, xmlb, xmdm, xmdj, xmsl, xmstatus, sfflag, bgdh, bglx)
    VALUES (@brlb, @patid, @curno, @zxksdm, @zxysdm, @logno, @applyno, @groupno, @xmlb, @xmdm, @xmdj, @xmsl, @xmstatus, @sfflag, @bgdh, @bglx);
    SET @LogId = SCOPE_IDENTITY();

    if @xmstatus = '3'
    BEGIN
        UPDATE dbo.interface_state
        SET 
            state       = 1,
            state_name  = N'取消登记',
            update_time = GETDATE(),
            param_type  = '3'  -- LIS系统固定param_type为3
        WHERE 
            bar_code = @bgdh;
    END

    


    SELECT 'T' AS BZ, '' AS errmsg

    -- 更新日志记录结果
    UPDATE dbo.usp_yjjk_yjqr_log 
    SET result = CASE WHEN @Success = 1 THEN '200' ELSE '-1' END,
        errormessage = CASE WHEN @Success = 1 THEN 'success' ELSE @ErrorMsg END
    WHERE id = @LogId;

END
GO

PRINT '存储过程 usp_yjjk_yjqr 已升级完成！'