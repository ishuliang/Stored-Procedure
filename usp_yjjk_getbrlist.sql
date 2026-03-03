ALTER PROCEDURE dbo.usp_yjjk_getbrlist
(
    @brlb       VARCHAR(100) = NULL,   -- 病人类别
    @hzxm       VARCHAR(100) = NULL,   -- 病人姓名
    @ksdm       VARCHAR(100) = NULL,   -- 科室代码
    @bqdm       VARCHAR(100) = NULL,   -- 病区代码
    @cwdm       VARCHAR(100) = NULL,   -- 床位代码
    @rq1        VARCHAR(100) = NULL,   -- 开始日期
    @rq2        VARCHAR(100) = NULL,   -- 结束日期
    @fph        VARCHAR(100) = NULL,   -- 发票号
    @codetype   VARCHAR(100) = NULL,   -- 卡类型：0磁卡，1体检号
    @zxksdm     VARCHAR(100) = NULL,   -- 执行科室代码
    @jzbrbz     INT          = NULL    -- 急诊标志
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE 
        @LogId       INT = 0,
        @Rows        INT  = 0,
        @Success     BIT           = 1,
        @ErrorMsg    NVARCHAR(1000) = NULL,
        @SQL         NVARCHAR(MAX) = N'',
        @Where       NVARCHAR(MAX) = N'',
        @rq1_dt  DATETIME2 = NULL,
        @rq2_dt  DATETIME2 = NULL

    -- 插入日志记录
    INSERT INTO dbo.usp_yjjk_getbrlist_log (brlb, hzxm, ksdm, bqdm, cwdm, rq1, rq2, fph, codetype, zxksdm, jzbrbz)
    VALUES (@brlb, @hzxm, @ksdm, @bqdm, @cwdm, @rq1, @rq2, @fph, @codetype, @zxksdm, @jzbrbz);
    SET @LogId = SCOPE_IDENTITY();
 

    -- ==================== 动态构建 WHERE 条件（安全防注入）===================
    IF @hzxm IS NOT NULL AND LTRIM(RTRIM(@hzxm)) <> ''
        SET @Where += ' AND vp.PatientName = @hzxm'
    IF @rq1 IS NOT NULL AND LTRIM(RTRIM(@rq1)) <> ''
    BEGIN
        SET @rq1_dt  = TRY_CAST(
                                   RTRIM(
                                     STUFF(STUFF(STUFF(@rq1, 9, 0, ' '), 7, 0, '-'), 5, 0, '-')
                                   ) AS DATETIME2)
        SET @Where += ' AND vp.RegisterTime >= @rq1_dt'
    END
    IF @rq2 IS NOT NULL AND LTRIM(RTRIM(@rq2)) <> ''
    BEGIN
        SET @rq2_dt  = TRY_CAST(
                                   RTRIM(
                                     STUFF(STUFF(STUFF(@rq2, 9, 0, ' '), 7, 0, '-'), 5, 0, '-')
                                   ) AS DATETIME2)
        SET @Where += ' AND vp.RegisterTime <= @rq2_dt'
    END
    IF @zxksdm is NOT NULL AND LTRIM(RTRIM(@zxksdm)) <> ''
        SET @Where += ' AND dd.interfaceCode1 = @zxksdm'

    SET @SQL = N'
        SELECT TOP (1) WITH TIES
            vp.patientName                        AS PatName,
            ISNULL(vp.AGE, 0)                     AS Age,
            ISNULL(vp.SEX, '''')                    AS Sex,
            ''tijianke''                            AS ApplyDept,
            ''''                                    AS Ward,
            ''''                                    AS BedNo,
            vp.patientcode                        AS HospNo,
            ISNULL(LTRIM(RTRIM(vp.address)), '''')  AS Address,
            ISNULL(LTRIM(RTRIM(vp.PHONE)), '''')    AS Phone,
            vp.patientcode                        AS PatientID,
            vp.patientcode                        AS CureNo,
            ''''                                    AS yblx,
            ''''                                    AS lcljbz,
            ''''                                    AS PatNameSpell,
            vp.RegisterTime                       AS ApplyTime,
            dd.interfacecode1
        FROM dbo.vocapatient vp
        INNER JOIN VocaPatientFeeItem vpfi ON vp.ID_Patient = vpfi.ID_Patient
        INNER JOIN DictFeeItem dfi        ON dfi.ID_FeeItem = vpfi.ID_FeeItem
        INNER JOIN DictDepart dd          ON dd.ID_Depart = vpfi.ID_Depart
        WHERE vp.IS_State < 6
        AND (vpfi.IS_FeeState IN (1,4) OR (vpfi.IS_FeeType = 1 AND ISNULL(vpfi.IS_FeeState,0) <> 2))
        AND ISNULL(vpfi.IS_LisState,''0'') IN (''0'',''1'')
        AND ISNULL(vpfi.IS_Examine,''0'') <> ''3''
        AND ISNULL(vpfi.IS_Suspend,'''') <> ''2'''
      + @Where
      + N' ORDER BY ROW_NUMBER() OVER (PARTITION BY vp.patientcode ORDER BY (SELECT NULL))'

    BEGIN TRY

        -- 执行查询（第一结果集：业务数据）
        EXEC sp_executesql @SQL, 
             N'@hzxm VARCHAR(100), @rq1_dt DATETIME2, @rq2_dt DATETIME2, @zxksdm VARCHAR(100)',
             @hzxm = @hzxm,
             @rq1_dt = @rq1_dt,
             @rq2_dt = @rq2_dt,
             @zxksdm = @zxksdm
        
        SET @Rows = @@ROWCOUNT
    END TRY
    BEGIN CATCH
        SET @Success = 0
        SET @ErrorMsg = ERROR_MESSAGE()
        SELECT 'F' AS BZ, @ErrorMsg AS errmsg

    END CATCH

    -- 更新日志记录结果
    UPDATE dbo.usp_yjjk_getbrlist_log 
    SET result = CASE WHEN @Success = 1 THEN '200' ELSE '-1' END,
        errormessage = CASE WHEN @Success = 1 THEN 'success' ELSE @ErrorMsg END
    WHERE id = @LogId;

END
GO

PRINT '存储过程 usp_yjjk_tjbrcx 已升级完成！'