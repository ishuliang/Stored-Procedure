/*--------------------------------------------------------------------------------------
<描述>： 医技报告回收
<测试>： exec up_interface_RIS_WN_yjbghuishou 'RIS','2142254','2','80000000170'
<日志>： select * from up_interface_RIS_WN_yjbghuishou_log order by create_time desc
--------------------------------------------------------------------------------------*/  

ALTER PROCEDURE dbo.up_interface_RIS_WN_yjbghuishou
(
    @Syscode   VARCHAR(100) = NULL,   -- 调用系统：LIS / RIS
    @Applyno   VARCHAR(100) = NULL,  
    @Brlb VARCHAR(100) = NULL,
    @OrgApplyNo VARCHAR(100) = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE 
        @LogId       INT = 0,
        @Success     BIT  = 1,
        @ErrorMsg    NVARCHAR(MAX) = '成功',
        @LogParams   NVARCHAR(MAX) = NULL,
        @ExecutedSQL NVARCHAR(MAX) = NULL,
        @patientCode VARCHAR(50),
        @UpdateCount INT = 0

    -- 插入日志记录
    INSERT INTO dbo.up_interface_RIS_WN_yjbghuishou_log (Syscode, Applyno, Brlb, OrgApplyNo)
    VALUES (@Syscode, @Applyno, @Brlb, @OrgApplyNo);
    SET @LogId = SCOPE_IDENTITY();

    -- ==================== 统一拼装日志参数（键=值;）===================

    BEGIN TRY

        -- ==================== 总检状态校验 ====================
        IF EXISTS(SELECT 1 FROM VocaPatient vp LEFT JOIN VocaPatientFeeItem vpfi on vp.ID_Patient = vpfi.ID_Patient WHERE vp.IS_State >= 5 AND vpfi.applyId = @OrgApplyNo)
            RAISERROR('体检系统已开始总检,不能回收报告!如需修改请电话联系体检中心!', 16, 1)

        -- ==================== 业务处理：执行回收（你原来的逻辑）===================
        -- 修改报告状态为撤销报告
        UPDATE dbo.interface_state
                SET 
                    state       = 3,
                    state_name  = N'取消审核',
                    update_time = GETDATE()
                WHERE 
                    apply_no = @OrgApplyNo;

            
        SELECT 'T' AS Code, '' AS errmsg

    END TRY
    BEGIN CATCH
        SET @Success = 0
        SET @ErrorMsg = ERROR_MESSAGE()
        SELECT 'F' AS Code, @ErrorMsg AS errmsg
    END CATCH

    -- 更新日志记录结果
    UPDATE dbo.up_interface_RIS_WN_yjbghuishou_log 
    SET result = CASE WHEN @Success = 1 THEN '200' ELSE '-1' END,
        errormessage = CASE WHEN @Success = 1 THEN 'success' ELSE @ErrorMsg END
    WHERE id = @LogId;

END
GO

PRINT '存储过程 up_interface_RIS_WN_yjbghuishou 已升级完成！'