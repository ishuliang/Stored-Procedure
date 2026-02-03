USE [HEMS_V5]
GO

-- =============================================
-- 医技报告回收接口
-- 日志已统一 + 支持省略参数调用
-- =============================================
IF OBJECT_ID('dbo.usp_yjjk_jg_huishou_sx', 'P') IS NOT NULL
    DROP PROCEDURE dbo.usp_yjjk_jg_huishou_sx
GO

CREATE PROCEDURE dbo.usp_yjjk_jg_huishou_sx
(
    @repno   VARCHAR(100) = NULL,   -- 报告单号（必传）
    @replb   VARCHAR(100) = NULL,   -- 报告类别
    @syscode VARCHAR(100) = NULL    -- 调用系统：LIS / RIS
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE 
        @Success     BIT  = 1,
        @ErrorMsg    NVARCHAR(MAX) = '成功',
        @ClientIP    NVARCHAR(50)  = NULL,
        @LogParams   NVARCHAR(MAX) = NULL,
        @ExecutedSQL NVARCHAR(MAX) = NULL,
        @patientCode VARCHAR(50)

    -- 获取调用者IP
    SELECT @ClientIP = client_net_address 
    FROM sys.dm_exec_connections 
    WHERE session_id = @@SPID

    -- 把 NULL 转成空字符串，保持和老接口完全兼容
    SET @repno   = ISNULL(LTRIM(RTRIM(@repno)), '')
    SET @replb   = ISNULL(LTRIM(RTRIM(@replb)), '')
    SET @syscode = ISNULL(LTRIM(RTRIM(@syscode)), '')

    -- ==================== 统一拼装日志参数（键=值;）===================
    SET @LogParams = 
        'repno='   + @repno +
        ';replb='   + @replb +
        ';syscode=' + @syscode

    BEGIN TRY

        -- ==================== 参数必填校验 ====================
        IF @repno = ''
            RAISERROR('repno 报告单号不能为空！', 16, 1)

        -- ==================== 业务校验：报告是否存在 ====================
        IF NOT EXISTS(
            SELECT 1 FROM VocaPatient vp
            INNER JOIN VocaPatientFeeItem vpfi ON vp.ID_Patient = vpfi.ID_Patient
            WHERE vpfi.applyId = @repno
        )
            RAISERROR('repno 值不对，在体软中没有找到该报告数据！', 16, 1)

        -- 获取病人编码用于总检判断
        SELECT TOP 1 @patientCode = vp.PatientCode
        FROM VocaPatient vp
        INNER JOIN VocaPatientFeeItem vpfi ON vp.ID_Patient = vpfi.ID_Patient
        WHERE vpfi.applyId = @repno

        -- ==================== 总检状态校验 ====================
        IF EXISTS(SELECT 1 FROM VocaPatient WHERE IS_State >= 5 AND PatientCode = @patientCode)
            RAISERROR('体检系统已开始总检,不能回收报告!如需修改请电话联系体检中心!', 16, 1)

        -- ==================== 业务处理：执行回收（你原来的逻辑）===================
        -- 修改报告状态为撤销报告

        SELECT 'T' AS BZ, '' AS errmsg


    END TRY
    BEGIN CATCH
        SET @Success = 0
        SET @ErrorMsg = ERROR_MESSAGE()
        SELECT 'F' AS BZ, @ErrorMsg AS errmsg
    END CATCH

    -- ==================== 统一写入全局日志表 ====================
    INSERT INTO dbo.InterfaceCallLog
        (ProcName, Params, ClientIP, CallTime, Success, ReturnRows, ErrorMessage, ExecUser)
    VALUES
        ('usp_yjjk_jg_huishou', @LogParams, @ClientIP, GETDATE(), @Success, 1, 
         @ErrorMsg, ORIGINAL_LOGIN())

END
GO

PRINT '存储过程 usp_yjjk_jg_huishou 已升级完成！'