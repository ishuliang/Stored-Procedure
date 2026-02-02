USE [HEMS_V5]
GO

-- =============================================
-- 获取在院病人信息列表
-- 日志已全局统一，所有值带单引号，超级清晰！
-- =============================================
IF OBJECT_ID('dbo.usp_yjjk_getbrlist_sx', 'P') IS NOT NULL
    DROP PROCEDURE dbo.usp_yjjk_getbrlist_sx
GO

CREATE PROCEDURE dbo.usp_yjjk_getbrlist_sx
(
    @brlb       VARCHAR(100) = NULL,   -- 病人类别
    @hzxm       VARCHAR(100) = NULL,   -- 病人姓名
    @ksdm       VARCHAR(100) = NULL,   -- 科室代码
    @bqdm       VARCHAR(100) = NULL,   -- 病区代码
    @cwdm       VARCHAR(100) = NULL,   -- 床位代码
    @rq1        DATETIME     = NULL,   -- 开始日期（包含）
    @rq2        DATETIME     = NULL,   -- 结束日期（包含）
    @fph        VARCHAR(100) = NULL,   -- 发票号
    @codetype   VARCHAR(100) = NULL,   -- 卡类型：0磁卡，1体检号
    @zxksdm     VARCHAR(100) = NULL,   -- 执行科室代码
    @jzbrbz     INT          = NULL    -- 急诊标志
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE 
        @Rows        INT  = 0,
        @Success     BIT           = 1,
        @ErrorMsg    NVARCHAR(1000) = NULL,
        @ClientIP    NVARCHAR(50)  = NULL,
        @LogParams   NVARCHAR(MAX) = N'',
        @SQL         NVARCHAR(MAX) = N'',
        @Where       NVARCHAR(MAX) = N''

    -- 获取调用者IP
    SELECT @ClientIP = client_net_address 
    FROM sys.dm_exec_connections 
    WHERE session_id = @@SPID



    SET @LogParams = 
        'brlb='''       + ISNULL(NULLIF(LTRIM(RTRIM(@brlb)),''), '')       + '''' +
        ';hzxm='''      + ISNULL(NULLIF(LTRIM(RTRIM(@hzxm)),''), '')       + '''' +
        ';ksdm='''      + ISNULL(NULLIF(LTRIM(RTRIM(@ksdm)),''), '')       + '''' +
        ';bqdm='''      + ISNULL(NULLIF(LTRIM(RTRIM(@bqdm)),''), '')       + '''' +
        ';cwdm='''      + ISNULL(NULLIF(LTRIM(RTRIM(@cwdm)),''), '')       + '''' +
        ';rq1='''       + ISNULL(CONVERT(VARCHAR(23), @rq1, 120), '')     + '''' +
        ';rq2='''       + ISNULL(CONVERT(VARCHAR(23), @rq2, 120), '')     + '''' +
        ';fph='''       + ISNULL(NULLIF(LTRIM(RTRIM(@fph)),''), '')        + '''' +
        ';codetype='''  + ISNULL(NULLIF(LTRIM(RTRIM(@codetype)),''), '')   + '''' +
        ';zxksdm='''    + ISNULL(NULLIF(LTRIM(RTRIM(@zxksdm)),''), '')     + '''' +
        ';jzbrbz='''    + ISNULL(CAST(@jzbrbz AS VARCHAR(10)), '')        + ''''

    -- ==================== 动态构建 WHERE 条件（安全防注入）===================
    IF @hzxm IS NOT NULL
        SET @Where += ' AND vp.PatientName = @hzxm'
    IF @rq1 IS NOT NULL
        SET @Where += ' AND vp.RegisterTime >= @rq1'
    IF @rq2 IS NOT NULL
        SET @Where += ' AND vp.RegisterTime <= @rq2'

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
             N'@hzxm VARCHAR(100), @rq1 DATETIME, @rq2 DATETIME, @zxksdm VARCHAR(100)',
             @hzxm = @hzxm,
             @rq1 = @rq1,
             @rq2 = @rq2,
             @zxksdm = @zxksdm
        
        SET @Rows = @@ROWCOUNT
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
        ('usp_yjjk_bgztxg', @LogParams, @ClientIP, GETDATE(), @Success, @Rows, 
         @ErrorMsg, ORIGINAL_LOGIN())

END
GO

PRINT '存储过程 usp_yjjk_tjbrcx 已升级完成！'