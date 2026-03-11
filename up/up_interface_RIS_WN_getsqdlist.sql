
ALTER PROCEDURE dbo.up_interface_RIS_WN_getsqdlist
(
    @Brlb            VARCHAR(100) = NULL,   -- 1=门诊 2=住院 3=体检
    @Cureno          VARCHAR(100) = NULL,   -- 就诊流水号（当前住院的首页序号）
    @Cardno          VARCHAR(100) = NULL,
    @hzxm            VARCHAR(100) = NULL,
    @ksdm            VARCHAR(100) = NULL,
    @bqdm            VARCHAR(100) = NULL,
    @zxksdm          VARCHAR(100) = NULL,
    @xmdm            VARCHAR(100) = NULL,
    @xmlb            VARCHAR(100) = NULL,
    @xmstatus        VARCHAR(100) = NULL,
    @Rq1             VARCHAR(100) = NULL,   -- 开始日期yyyy-mm-dd
    @rq2             VARCHAR(100) = NULL   -- 结束日期yyyy-mm-dd
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE 
        @LogId       INT = 0,
        @Success     BIT  = 1,
        @Rows        INT  = 0,
        @ErrorMsg    NVARCHAR(1000) = NULL,
        @SQL         NVARCHAR(MAX) = N'',
        @Where       NVARCHAR(MAX) = N'',
        @Debug       BIT         = 1  -- 调试模式，0为关闭，1为开启

    -- 插入日志记录
    INSERT INTO dbo.up_interface_RIS_WN_getsqdlist_log (brlb, cureno, cardno, hzxm, ksdm, bqdm, zxksdm, xmdm, xmlb, xmstatus, rq1, rq2)
    VALUES (@Brlb, @Cureno, @Cardno, @hzxm, @ksdm, @bqdm, @zxksdm, @xmdm, @xmlb, @xmstatus, @Rq1, @rq2);
    SET @LogId = SCOPE_IDENTITY();


    BEGIN TRY

        IF @Brlb IS NULL OR (@Brlb <> 2)
            RAISERROR('病人类别不正确！超声检查为2', 16, 1)



        IF ISNULL(@Rq1, '') <> ''
        BEGIN 
            SET @Where += ' AND vpfi.RegisterTime >= @Rq1'                      
        END
        IF ISNULL(@rq2, '') <> ''
        BEGIN 
            SET @Where += ' AND vpfi.RegisterTime <= @rq2'                      
        END

        IF ISNULL(@Cureno, '') <> ''
        BEGIN 
            SET @Where += ' AND vp.PatientCode = @Cureno'                       
        END

        -- ==================== 主查询SQL ====================
        SET @SQL = N'
            SELECT
                ''2''                                         AS PIDAuthority,
                vp.PatientCode                                AS PIDNumber,
                vp.PatientCode                                AS VisitNumber,
                ''THIS4''                                     AS OrderPlacer,
                ''''                                          AS PlacerOrderType,
                ''''                                          AS PlacerOrderNumber,
                ''未处理''                                     AS PlacerOrderStatus,
                vpfi.applyId                                  AS 申请单号,
                vp.PatientCode                                AS 病员号,
                ''''                                          AS 病人卡号,
                vp.PatientName                                AS 病人姓名,
                CASE 
                            WHEN vp.SEX IS NULL OR vp.SEX = '''' THEN ''''
                            WHEN vp.SEX = ''1'' THEN ''男''
                            WHEN vp.SEX = ''2'' THEN ''女''
                            ELSE vp.SEX
                                                            END AS 病人性别,
                ISNULL(vp.Age,0)                              AS 病人年龄,
                ''''                                          AS 病人科室,
                ''''                                          AS 病人病区,
                ''''                                          AS 病人床号,
                ISNULL(dictOperate.Number, '''')             AS 主治医生,
                vpfi.FeeItemName                              AS 检查项目,
                ''未处理''                                          AS 检查状态,
                ''''                                          AS 结算状态,
                vpfi.RegisterTime                             AS 请求日期,
                ''NULL''                                         AS 门急诊标志,
                ''体检超声''                              AS 申请单名称,
                ''已执行''                                          AS 收费状态,
                vpfi.applyId                                  AS 条形码,
                ''0''                                          AS 临床路径标志
            FROM VocaPatient vp
            INNER JOIN VocaPatientFeeItem vpfi ON vp.ID_Patient = vpfi.ID_Patient
            INNER JOIN DictFeeItem dfi         ON dfi.ID_FeeItem = vpfi.ID_FeeItem
            INNER JOIN DictDepart dd           ON dd.ID_Depart = vpfi.ID_Depart
            LEFT  JOIN DictUser dictOperate    ON dictOperate.ID_User = vpfi.ID_Operate
            WHERE vp.IS_State < 6
            AND dd.ServiceProviderType in (''WN'',''LIS'')
              AND (vpfi.IS_FeeState IN (1,4) OR (vpfi.IS_FeeType = 1 AND ISNULL(vpfi.IS_FeeState,0) <> 2))
              AND ISNULL(vpfi.IS_LisState,''0'') IN (''0'',''1'')
              AND ISNULL(vpfi.IS_Examine,''0'') <> ''3''
              AND ISNULL(vpfi.IS_Suspend,'''') <> ''2'' '
        + ISNULL(@Where, N'')

        IF @Debug = 1
        BEGIN
            DECLARE @DebugSQL NVARCHAR(MAX) = @SQL

            SET @DebugSQL = REPLACE(@DebugSQL, '@Rq1',  ISNULL('''' + @Rq1 + '''' , 'NULL'))
            SET @DebugSQL = REPLACE(@DebugSQL, '@rq2',  ISNULL('''' + @rq2 + '''' , 'NULL'))
            SET @DebugSQL = REPLACE(@DebugSQL, '@Cureno',   ISNULL('''' + @Cureno + '''', 'NULL'))
            PRINT @DebugSQL
        END                

        EXEC sp_executesql @SQL, 
            N'@Rq1 VARCHAR(100), @rq2 VARCHAR(100), @Cureno VARCHAR(100)',
            @Rq1=@Rq1,
            @rq2=@rq2,
            @Cureno=@Cureno

        SET @Rows = @@ROWCOUNT

        


    END TRY
    BEGIN CATCH
        SET @Success = 0
        SET @ErrorMsg = ERROR_MESSAGE()
        SELECT 'F' AS BZ, @ErrorMsg AS errmsg
    END CATCH

    -- 更新日志记录结果
    UPDATE dbo.up_interface_RIS_WN_getsqdlist_log 
    SET result = CASE WHEN @Success = 1 THEN '200' ELSE '-1' END,
        errormessage = CASE WHEN @Success = 1 THEN 'success' ELSE @ErrorMsg END
    WHERE id = @LogId;

END
GO

PRINT '存储过程 up_interface_RIS_WN_getsqdlist 创建成功！'