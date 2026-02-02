USE [interface_agent_sxzl]   
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_yjjk_getwzxxm') AND type = 'P')
    DROP PROCEDURE dbo.usp_yjjk_getwzxxm
GO

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

    BEGIN TRY
        IF @brlb IS NULL OR @brlb <> 3
            RAISERROR('病人类别不正确！必须为3（体检）', 16, 1);

        DECLARE @Where NVARCHAR(MAX) = N'
        WHERE vp.IS_State < 6
          AND dd.ServiceProviderType in (''PACS'',''LIS'',''WN'')
          AND (vpfi.IS_FeeState IN (1,4) OR (vpfi.IS_FeeType = 1 AND ISNULL(vpfi.IS_FeeState,0) <> 2))
          AND ISNULL(vpfi.IS_LisState,''0'') IN (''0'',''1'')
          AND ISNULL(vpfi.IS_Examine,''0'') <> ''3''
          AND ISNULL(vpfi.IS_Suspend,'''') <> ''2''
          ';

        IF ISNULL(@curno, '')  <> ''   SET @Where += ' AND vpfi.barCode = @curno';
       
        IF @rq1_dt IS NOT NULL         SET @Where += ' AND vpfi.RegisterTime >= @rq1_dt';
        IF @rq2_dt IS NOT NULL         SET @Where += ' AND vpfi.RegisterTime <= @rq2_dt'; 
		
        IF @sqdxh IS NOT NULL 
			AND @sqdxh <> '0'
			AND LTRIM(RTRIM(@sqdxh)) <> ''
		BEGIN
			SET @Where += ' AND vpfi.applyId = @sqdxh';
		END

        IF @patid IS NOT NULL 
			AND @patid <> '-1'
			AND LTRIM(RTRIM(@patid)) <> ''
		BEGIN
			SET @Where += ' AND vp.patientcode = @patid';
		END

        DECLARE @SQL NVARCHAR(MAX) = N'
        SELECT
            vp.PatientCode                                          AS PatientID,
            vp.PatientCode                                          AS CureNo,
            vpfi.ID_PatientFeeItem                                  AS LogNo,
            vpfi.applyId                                            AS HisApplyNo,
            vpfi.applyId                                                    AS GroupNo,
            dfi.InterfaceCode1                                      AS ItemCode,
            dfi.FeeItemName                                         AS ItemName,
            vpfi.FactPrice * 1.0 / 100                              AS Price,
            ''1''                                                   AS ItemQty,
            ''''                                                    AS ItemUnit,
            vpfi.RegisterTime                                       AS ApplyTime,
            vpfi.RegisterTime                                       AS ReceiveTime,
            ''''                                                    AS CheckTime,
            ISNULL(dictOperate.Number, '''')                        AS ApplyDocCode,
            ''632''                                                    AS ApplyDept,
            dd.InterfaceCode1                                       AS ExecDept,
            ''0''                                                   AS Status,
            ''0''                                                    AS ItemType,
            ''0''                                                   AS AddType,
            ''1''                                                   AS chargeFlag,
            ''0''                                                   AS Mjzbz,
            ISNULL(dst.SampleCode, '''')                            AS Specimen,
            ISNULL(dst.SampleName, '''')                            AS SpecimenDesc,
            ''''                                                    AS ItemMemo,
            ''''                                                    AS fph,
            ''''                                                    AS ClinicDesc,
            ''''                                                    AS ghxh,
            ''''                                                    AS SerialNo,
            ''-1''                                           AS ApplyNo,
            ISNULL(dictOperate.Number, '''')                        AS OperatorCode,
            ISNULL(dictOperate.UserName, '''')                      AS OperatorName
        FROM VocaPatient vp
        INNER JOIN VocaPatientFeeItem vpfi      ON vp.ID_Patient = vpfi.ID_Patient
        INNER JOIN DictFeeItem dfi              ON dfi.ID_FeeItem = vpfi.ID_FeeItem
        INNER JOIN DictDepart dd                ON dd.ID_Depart = vpfi.ID_Depart
        LEFT  JOIN DictUser dictOperate         ON dictOperate.ID_User = vpfi.ID_Operate
        LEFT  JOIN DictSampleType dst           ON dfi.ID_SampleType = dst.ID_SampleType
        ' + @Where;

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

    EXEC dbo.usp_sys_WriteInterfaceLog 
        @ProcName = 'usp_yjjk_getwzxxm', 
        @Params = NULL, 
        @Success = @Success, 
        @ReturnRows = @Rows, 
        @ErrorMsg = @ErrorMsg;

END
GO