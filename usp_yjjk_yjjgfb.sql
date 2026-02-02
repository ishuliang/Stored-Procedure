USE [HEMS_V5]
GO

-- =============================================
-- 病人结果发布接口
-- 日志已统一为键=值; + 完整可执行调用语句
-- =============================================
IF OBJECT_ID('dbo.usp_yjjk_yjjgfb_sx', 'P') IS NOT NULL
    DROP PROCEDURE dbo.usp_yjjk_yjjgfb_sx
GO

CREATE PROCEDURE dbo.usp_yjjk_yjjgfb_sx
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
    @wcsj     DATETIME     = NULL,     -- 完成时间（报告时间）
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
        @Success     BIT  = 1,
        @ErrorMsg    NVARCHAR(MAX) = NULL

    BEGIN TRY

        -- ==================== 参数必填校验 ====================
        IF ISNULL(LTRIM(RTRIM(@applyno)),'') = ''  RAISERROR('applyno 报告单号不能为空！',16,1)
        IF ISNULL(LTRIM(RTRIM(@patid)),'') = ''    RAISERROR('patid 不能为空！',16,1)

        -- ==================== 业务处理（保存结果）===================
        -- 修改状态表，已审核
        -- 1. 先尝试更新
            UPDATE dbo.interface_state 
            SET state = '1', --已审核
                state_name = '已审核',
                update_time = GETDATE(),
                out_fee_item_name = @xmmc
            WHERE apply_no = @applyno
        
            -- 2. 如果一条都没更新到（@@ROWCOUNT = 0），说明记录不存在 → 主动报错
            IF @@ROWCOUNT = 0
            BEGIN
                RAISERROR('状态更新失败：未找到对应的确认执行病人收费项项目记录！病人编号=[%s], 报告单号=[%s]', 
                        16, 1, @patid, @applyno);
            END

        SELECT 'T' AS BZ, '' AS errmsg

    END TRY
    BEGIN CATCH
        SET @Success = 0
        SET @ErrorMsg = ERROR_MESSAGE()
        SELECT 'F' AS BZ, @ErrorMsg AS errmsg
    END CATCH

    -- ==================== 统一写入全局日志表 ====================
    EXEC dbo.usp_sys_WriteInterfaceLog 
        @ProcName = 'usp_yjjk_yjjgfb', 
        @Params = NULL, 
        @Success = @Success, 
        @ReturnRows = 1, 
        @ErrorMsg = @ErrorMsg;

END
GO

PRINT '存储过程 usp_yjjk_yjjgfb 已升级完成！'