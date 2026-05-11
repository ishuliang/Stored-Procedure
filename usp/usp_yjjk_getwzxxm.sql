/*--------------------------------------------------------------------------------------
<描述>： 获取病人未执行医嘱项目
<更新>： 本次修改为查询视图 wn_lis_getwzxxm
<测试>： EXEC usp_yjjk_getwzxxm  '3', '-1', '8000211000', '2024012300:00:00', '2026012223:59:59', '0', '0'
<日志>： select * from up_interface_RIS_WN_bgztxg_log order by create_time desc
<日志>： select * from usp_yjjk_getwzxxm_log order by create_time desc
--------------------------------------------------------------------------------------*/
ALTER PROCEDURE dbo.usp_yjjk_getwzxxm
(
    @brlb     INT           = NULL,
    @patid    VARCHAR(100)  = NULL,
    @curno    VARCHAR(100)  = NULL,
    @rq1      VARCHAR(20)   = NULL,
    @rq2      VARCHAR(20)   = NULL,
    @sqdxh    VARCHAR(100)  = NULL,
    @yexh     VARCHAR(100)  = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE
        @LogId     INT = 0,
        @rq1_dt  DATETIME2 = TRY_CAST(
                           RTRIM(
                             STUFF(STUFF(STUFF(@rq1, 9, 0, ' '), 7, 0, '-'), 5, 0, '-')
                           ) AS DATETIME2),
        @rq2_dt  DATETIME2 = TRY_CAST(
                           RTRIM(
                             STUFF(STUFF(STUFF(@rq2, 9, 0, ' '), 7, 0, '-'), 5, 0, '-')
                           ) AS DATETIME2);

    DECLARE
        @Rows      INT  = 0,
        @Success   BIT  = 1,
        @ErrorMsg  NVARCHAR(1000) = NULL;

    -- 插入日志记录
    INSERT INTO dbo.usp_yjjk_getwzxxm_log (brlb, patid, curno, rq1, rq2, sqdxh, yexh)
    VALUES (@brlb, @patid, @curno, @rq1, @rq2, @sqdxh, @yexh);
    SET @LogId = SCOPE_IDENTITY();

    BEGIN TRY
        IF @brlb IS NULL OR @brlb <> 3
            RAISERROR('病人类别不正确！必须为3（体检）', 16, 1);

        DECLARE @Where NVARCHAR(MAX) = N'
        WHERE 1=1';

        IF ISNULL(@curno, '')  <> ''   SET @Where += ' AND barCode = @curno';

        IF @rq1_dt IS NOT NULL         SET @Where += ' AND ApplyTime >= @rq1_dt';
        IF @rq2_dt IS NOT NULL         SET @Where += ' AND ApplyTime <= @rq2_dt';

        IF @sqdxh IS NOT NULL
			AND @sqdxh <> '0'
			AND LTRIM(RTRIM(@sqdxh)) <> ''
		BEGIN
			SET @Where += ' AND HisApplyNo = @sqdxh';
		END

        IF @patid IS NOT NULL
			AND @patid <> '-1'
			AND LTRIM(RTRIM(@patid)) <> ''
		BEGIN
			SET @Where += ' AND PatientID = @patid';
		END

        DECLARE @SQL NVARCHAR(MAX) = N'
        SELECT
            PatientID,
            CureNo,
            LogNo,
            HisApplyNo,
            GroupNo,
            ItemCode,
            ItemName,
            Price,
            ItemQty,
            ItemUnit,
            ApplyTime,
            ReceiveTime,
            CheckTime,
            ApplyDocCode,
            ApplyDept,
            ExecDept,
            Status,
            ItemType,
            AddType,
            chargeFlag,
            Mjzbz,
            Specimen,
            SpecimenDesc,
            ItemMemo,
            fph,
            ClinicDesc,
            ghxh,
            SerialNo,
            ApplyNo,
            OperatorCode,
            OperatorName
        FROM wn_lis_getwzxxm
        ' + @Where;
        print @SQL;
        EXEC sp_executesql @SQL,
            N'@patid VARCHAR(100), @curno VARCHAR(100), @rq1_dt DATETIME, @rq2_dt DATETIME2, @sqdxh VARCHAR(100)',
            @patid  = @patid,
            @curno  = @curno,
            @rq1_dt = @rq1_dt,
            @rq2_dt = @rq2_dt,
            @sqdxh  = @sqdxh;

        SET @Rows = @@ROWCOUNT;

    END TRY
    BEGIN CATCH
        SET @Success  = 0;
        SET @ErrorMsg = ERROR_MESSAGE();
        SELECT 'F' AS BZ, @ErrorMsg AS errmsg;
    END CATCH

    -- 更新日志记录结果
    UPDATE dbo.usp_yjjk_getwzxxm_log 
    SET result = CASE WHEN @Success = 1 THEN '200' ELSE '-1' END,
        errormessage = CASE WHEN @Success = 1 THEN 'success' ELSE @ErrorMsg END
    WHERE id = @LogId;

END
GO