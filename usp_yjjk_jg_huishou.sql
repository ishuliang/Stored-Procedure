ALTER PROCEDURE dbo.usp_yjjk_jg_huishou
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
        @LogParams   NVARCHAR(MAX) = NULL,
        @ExecutedSQL NVARCHAR(MAX) = NULL,
        @patientCode VARCHAR(50),
        @UpdateCount INT = 0

    -- 把 NULL 转成空字符串，保持和老接口完全兼容
    SET @repno   = ISNULL(LTRIM(RTRIM(@repno)), '')
    SET @replb   = ISNULL(LTRIM(RTRIM(@replb)), '')
    SET @syscode = ISNULL(LTRIM(RTRIM(@syscode)), '')

    -- ==================== 统一拼装日志参数（键=值;）===================

    BEGIN TRY
        -- ==================== 参数必填校验 ====================
        IF @repno = ''
            RAISERROR('repno 报告单号不能为空！', 16, 1)


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
        UPDATE dbo.interface_state
                SET 
                    state       = 3,
                    state_name  = N'取消审核',
                    update_time = GETDATE()
                WHERE 
                    report_no = @repno;
        SET @UpdateCount = @@ROWCOUNT;
        IF @UpdateCount != 1
            RAISERROR('没有找到该报告数据！', 16, 1)

        SELECT 'T' AS BZ, '' AS errmsg


    END TRY
    BEGIN CATCH
        SET @Success = 0
        SET @ErrorMsg = ERROR_MESSAGE()
        SELECT 'F' AS BZ, @ErrorMsg AS errmsg
    END CATCH

    -- ==================== 统一写入全局日志表 ====================
    EXEC dbo.usp_sys_WriteInterfaceLog 
        @ProcName = 'usp_yjjk_jg_huishou', 
        @Params = NULL, 
        @Success = @Success, 
        @ReturnRows = @UpdateCount, 
        @ErrorMsg = @ErrorMsg;

END
GO

PRINT '存储过程 usp_yjjk_jg_huishou 已升级完成！'