ALTER PROCEDURE dbo.usp_yjjk_jcbrfb
(
    @repno     VARCHAR(500) = '',   -- 报告单号（必传）
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
    @sjrq      VARCHAR(100) = '',
    @reprq     VARCHAR(100) = '', -- 报告时间（必传）
    @replb     VARCHAR(100) = '',
    @replbmc   VARCHAR(100) = '',
    @xtbz      VARCHAR(100) = '',
    @jcbw      VARCHAR(100) = '',
    @jcysdm    VARCHAR(100) = NULL, -- 执行医生代码（必传）
    @jcysxm    VARCHAR(100) = NULL, -- 执行医生姓名（必传）
    @jcksdm    VARCHAR(100) = '',
    @jcksmc    VARCHAR(100) = '',
    @wjbz      VARCHAR(100) = '',
    @instname  VARCHAR(100) = '',
    @techno    VARCHAR(100) = '',
    @cyrq      VARCHAR(100) = '',   -- 采样时间（必传）
    @shys      VARCHAR(100) = NULL, -- 审核医生姓名（必传）
    @crbz      VARCHAR(100) = NULL,
    @shysdm    VARCHAR(100) = NULL, -- 审核医生代码（必传）
    @bbjsrq    VARCHAR(100) = NULL,
    @memo      VARCHAR(100) = '',
    @ghxh      VARCHAR(100) = ''
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE 
        @Success     BIT  = 1,
        @ErrorMsg    NVARCHAR(MAX) = NULL,
		 @UpdateCount INT = 0  -- 新增：记录更新行数

    BEGIN TRY

        -- ==================== 参数必填校验 ====================
        IF ISNULL(LTRIM(RTRIM(@repno)),'') = ''      RAISERROR('repno 报告单号不能为空！',16,1)
        
        -- ==================== 业务处理===================
        -- 根据报告单号来修改对应的状态，如果没有就返回报错
        UPDATE dbo.interface_state
        SET 
            state       = 1,
            state_name  = N'已审核',
            update_time = GETDATE(),
            param_type  = '3'  -- LIS系统固定param_type为3
        WHERE 
            report_no = @repno;

        SET @UpdateCount = @@ROWCOUNT;
        IF @UpdateCount = 0
            RAISERROR(N'状态更新失败：未找到对应的报告单号为 %s 的记录', 16, 1, @repno);

        SELECT 'T' AS BZ, '' AS errmsg

    END TRY
    BEGIN CATCH
        SET @Success = 0
        SET @ErrorMsg = ERROR_MESSAGE()
        SELECT 'F' AS BZ, @ErrorMsg AS errmsg
    END CATCH

    -- ==================== 统一写入全局日志表 ====================
    EXEC dbo.usp_sys_WriteInterfaceLog 
        @ProcName = 'usp_yjjk_jcbrfb', 
        @Params = NULL, 
        @Success = @Success, 
        @ReturnRows = @UpdateCount, 
        @ErrorMsg = @ErrorMsg;

END
GO

PRINT '存储过程 usp_yjjk_jcbrfb 已升级完成！'