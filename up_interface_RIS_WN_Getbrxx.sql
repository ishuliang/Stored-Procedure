ALTER PROCEDURE dbo.up_interface_RIS_WN_Getbrxx
(
    @brlb     INT         = NULL,      -- 病人类别：3=体检
    @codetype INT         = NULL,      -- 号码类型
    @code     NVARCHAR(50)= NULL,    -- 查询号码
	@yebz     NVARCHAR(50)= NULL,     -- 婴儿标志  
	@cybz     NVARCHAR(50)= NULL     -- 是否查出病人
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE 
        @LogId     INT = 0,
        @Rows      INT  = 0,
        @Success   BIT  = 1,
        @ErrorMsg  NVARCHAR(1000) = NULL,
        @SQL         NVARCHAR(MAX) = N'',
        @Where       NVARCHAR(MAX) = N''

    -- 插入日志记录
    INSERT INTO dbo.up_interface_RIS_WN_Getbrxx_log (brlb, codetype, code, yebz, cybz)
    VALUES (@brlb, @codetype, @code, @yebz, @cybz);
    SET @LogId = SCOPE_IDENTITY();

    BEGIN TRY
        IF @brlb IS NULL OR (@brlb <> 3 AND @brlb <> 9)
            RAISERROR('病人类别不正确！必须为3（体检）或9', 16, 1)

        IF ISNULL(LTRIM(RTRIM(@code)), '') = ''
            RAISERROR('code不能为空！', 16, 1)    

        IF @codetype IS NULL
            RAISERROR('号码类型(codetype)不能为空！', 16, 1);

        IF @codetype IN (1, 4)
            SET @Where = ' AND vp.patientcode = @code';
        ELSE IF @codetype = 10
            SET @Where = ' AND vp.IdentityCard = @code';
        ELSE IF @codetype = 2
            SET @Where = ' AND vpfi.barCode = @code'
        ELSE
            RAISERROR('不支持的号码类型，实际收到 codetype=%d，请确认是否正确', 16, 1, @codetype);

        SET @SQL = N'SELECT TOP
                    ( 1 ) WITH TIES * 
                    FROM
                    (SELECT
                        @brlb AS WardOrReg,      -- 动态返回病人类别
                        vp.patientcode          AS HospNo,
                        vp.patientcode           AS PatientID,
                        vp.patientcode          AS CureNo,
                        vp.patientName          AS PatName,
                        ISNULL(vp.AGE, 0)       AS Age,
                        ''''                      AS Age1,
                        ''岁''                    AS AgeUnit,
                        ''''                      AS AgeUnit1,
                        CASE 
                            WHEN vp.SEX IS NULL OR vp.SEX = '''' THEN ''''
                            WHEN vp.SEX = ''1'' THEN ''男''
                            WHEN vp.SEX = ''2'' THEN ''女''
                            ELSE vp.SEX
                        END AS Sex,
                        
                        ''632''                   AS ApplyDeptCode,
                        ''山西省肿瘤体检中心''              AS ApplyDept,
                        ''''                      AS Ward,
                        ''''                      AS BedNo,
                        ISNULL(vp.IdentityCard, '''') AS CardNo,
                        ''''                      AS chargeType,
                        ''''                      AS ApplyDoctor,
                        ISNULL(LTRIM(RTRIM(vp.address)), '''') AS Address,
                        ISNULL(LTRIM(RTRIM(vp.PHONE)), '''')   AS Phone,
                        ISNULL(vp.IdentityCard, '''') AS IDNum,
                        ''''                      AS ClincDesc,
                        ISNULL(vpe.Nation, ''汉族'') AS Nation,
                        vp.Birthday             AS Birthday,
                        ''''                      AS islcljbz,
                        ''''                      AS Invoice,
                        ''''                      AS icd10,
                        ''''                      AS icd10Name
                    FROM dbo.vocapatient vp
                    LEFT JOIN dbo.VocaPatientExtend vpe ON vp.ID_Patient = vpe.ID_Patient
                        INNER JOIN VocaPatientFeeItem vpfi ON vp.ID_Patient = vpfi.ID_Patient
                    INNER JOIN DictFeeItem dfi ON dfi.ID_FeeItem = vpfi.ID_FeeItem 
                    WHERE vp.IS_State < 6 -- 未完成总检
                        AND (vpfi.IS_FeeState IN (1,4) OR (vpfi.IS_FeeType = 1 AND ISNULL(vpfi.IS_FeeState,0) <> 2)) -- 收费或部分收费 or 团体收费且不能时拟退状态
                        AND ISNULL(vpfi.IS_LisState,''0'') IN (''0'',''1'')
                        AND ISNULL(vpfi.IS_Examine,''0'') <> ''3'' -- 非弃检【0/null:未发生 1:已检(有一个检查项开检就为已检) 2:延期(针对收费项)3:弃检】
                        AND ISNULL(vpfi.IS_Suspend,'''') <> ''2''
                        and vp.PatientCode IS NOT NULL
                    '+ @Where
                    + N') t 
                        ORDER BY ROW_NUMBER ( ) OVER ( PARTITION BY PatientID ORDER BY ( SELECT NULL ) )'
                        
        EXEC sp_executesql @SQL, 
                N'@brlb INT, @code NVARCHAR(50)',
                @brlb = @brlb,
                @code = @code

        SET @Rows = @@ROWCOUNT

    END TRY
    BEGIN CATCH
        SET @Success = 0
        SET @ErrorMsg = ERROR_MESSAGE()
        SET @Rows = 0
        SELECT 'F' AS BZ, @ErrorMsg AS errmsg
    END CATCH

    -- 统一日志出口
    LogAndExit:
    -- 更新日志记录结果
    UPDATE dbo.up_interface_RIS_WN_Getbrxx_log 
    SET result = CASE WHEN @Success = 1 THEN '200' ELSE '-1' END,
        errormessage = CASE WHEN @Success = 1 THEN 'success' ELSE @ErrorMsg END
    WHERE id = @LogId;

END
GO