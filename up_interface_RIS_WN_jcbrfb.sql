-- 默认成功
ALTER PROCEDURE dbo.up_interface_RIS_WN_jcbrfb
(
    @repno     VARCHAR(500) = '',   -- 报告单号（必传）
    @reqno     VARCHAR(500) = '',   -- 申请单号（必传）
    @syxh      VARCHAR(100) = '',   -- 体检号
    @patid     VARCHAR(100) = '',   -- 病人唯一标识
    @blh       VARCHAR(100) = '',
    @cardno    VARCHAR(100) = '',
    @hzxm      VARCHAR(100) = '',
    @sex       VARCHAR(100) = '',
    @age       VARCHAR(100) = '',
    @sjksdm    VARCHAR(100) = '',
    @sjksmc    VARCHAR(100) = '',
    @bqdm      VARCHAR(100) = '',
    @bqmc      VARCHAR(100) = '',
    @cwdm      VARCHAR(100) = '',
    @sjysdm    VARCHAR(100) = '',
    @sjysxm    VARCHAR(100) = '',
    @sjrq      VARCHAR(100) = '', -- 送检时间
    @replb     VARCHAR(100) = '',
    @replbmc   VARCHAR(100) = '',
    @reprq     VARCHAR(100) = '', -- 报告时间（必传）

    @xtbz      VARCHAR(100) = '',
    @jcbw      VARCHAR(100) = '',
    @jcysdm    VARCHAR(100) = NULL, -- 执行医生代码（必传）
    @jcysxm    VARCHAR(100) = NULL, -- 执行医生姓名（必传）
    @jcksdm    VARCHAR(100) = '',
    @jcksmc    VARCHAR(100) = '',
    @isly      VARCHAR(100) = '', -- 0
    @wjbz      VARCHAR(100) = '', -- 危急值标志
    @instname  VARCHAR(100) = '',
    @techno    VARCHAR(100) = '',
    @cyrq      VARCHAR(100) = '',   -- 采样时间（必传）
    @shys      VARCHAR(100) = NULL, -- 审核医生姓名（必传）
    @crbz      VARCHAR(100) = NULL,
    @shysdm    VARCHAR(100) = NULL, -- 审核医生代码（必传）
    @bbjsrq    VARCHAR(100) = NULL,
    @memo      VARCHAR(100) = ''
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE 
        @LogId       INT = 0,
        @Success     BIT  = 1,
        @ErrorMsg    NVARCHAR(MAX) = NULL,
		@UpdateCount INT = 0  -- 新增：记录更新行数

    -- 插入日志记录
    INSERT INTO dbo.up_interface_RIS_WN_jcbrfb_log (repno, reqno, syxh, patid, blh, cardno, hzxm, sex, age, sjksdm, sjksmc, bqdm, bqmc, cwdm, sjysdm, sjysxm, sjrq, replb, replbmc, reprq, xtbz, jcbw, jcysdm, jcysxm, jcksdm, jcksmc, isly, wjbz, instname, techno, cyrq, shys, crbz, shysdm, bbjsrq, memo)
    VALUES (@repno, @reqno, @syxh, @patid, @blh, @cardno, @hzxm, @sex, @age, @sjksdm, @sjksmc, @bqdm, @bqmc, @cwdm, @sjysdm, @sjysxm, @sjrq, @replb, @replbmc, @reprq, @xtbz, @jcbw, @jcysdm, @jcysxm, @jcksdm, @jcksmc, @isly, @wjbz, @instname, @techno, @cyrq, @shys, @crbz, @shysdm, @bbjsrq, @memo);
    SET @LogId = SCOPE_IDENTITY();

    BEGIN TRY
        -- 根据patient_code来修改报告单号（必传）
        UPDATE dbo.interface_state
                SET report_no = @repno
                WHERE patient_code = @patid;
        SET @UpdateCount = @@ROWCOUNT;
        
        SELECT 'T' AS BZ, '' AS errmsg
    END TRY
    BEGIN CATCH
        SET @Success = 0
        SET @ErrorMsg = ERROR_MESSAGE()
        SELECT 'F' AS BZ, @ErrorMsg AS errmsg
    END CATCH
    
    -- 更新日志记录结果
    UPDATE dbo.up_interface_RIS_WN_jcbrfb_log 
    SET result = CASE WHEN @Success = 1 THEN '200' ELSE '-1' END,
        errormessage = CASE WHEN @Success = 1 THEN 'success' ELSE @ErrorMsg END
    WHERE id = @LogId;

END
GO

PRINT '存储过程 up_interface_RIS_WN_jcbrfb 已升级完成！'
