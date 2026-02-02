USE [HEMS_V5]
GO

-- =============================================
-- 康科德接口：获取体检申请单列表（支持多条件查询）
-- 
-- =============================================
IF OBJECT_ID('dbo.usp_yjjk_getsqdlist', 'P') IS NOT NULL
    DROP PROCEDURE dbo.usp_yjjk_getsqdlist
GO

CREATE PROCEDURE dbo.usp_yjjk_getsqdlist
(
    @brlb      INT          = NULL,   -- 1=门诊 2=住院 3=体检
    @cureno     VARCHAR(100) = NULL,   -- 就诊流水号（当前住院的首页序号）
    @cardno    VARCHAR(100) = NULL,   -- 卡号 / 体检号
    @hzxm      VARCHAR(100) = NULL,   -- 病人姓名（支持模糊）
    @ksdm      VARCHAR(100) = NULL,   -- 科室代码
    @bqdm      VARCHAR(100) = NULL,   -- 病区代码
    @zxksdm    VARCHAR(100) = NULL,   -- 执行科室代码（如检验科、放射科）
    @xmdm      VARCHAR(100) = NULL,   -- 项目代码
    @xmlb      VARCHAR(100) = NULL,   -- 项目类别：0临床项目 1收费项目 2药品项目
    @xmstatus  VARCHAR(100) = NULL,   -- 项目状态：0未处理 1已确认
    @rq1       DATETIME     = NULL,   -- 开始日期（包含）
    @rq2       DATETIME     = NULL,   -- 结束日期（包含）
    @jzbz      INT          = NULL    -- 急诊标志：0=全部 1=急诊
)
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE 
        @Success     BIT  = 1,
        @Rows        INT  = 0,
        @ErrorMsg    NVARCHAR(1000) = NULL,
        @SQL         NVARCHAR(MAX) = N'',
        @Where       NVARCHAR(MAX) = N''

    -- 防 1900-01-01

    -- ==================== 动态条件拼接 + 参数收集 ====================
    IF NULLIF(LTRIM(RTRIM(@hzxm)), '') IS NOT NULL    BEGIN SET @Where += ' AND vp.PatientName LIKE ''%'' + @hzxm + ''%'''      END
    IF @rq1 IS NOT NULL                               BEGIN SET @Where += ' AND vpfi.RegisterTime >= @rq1'                      END
    IF @rq2 IS NOT NULL                               BEGIN SET @Where += ' AND vpfi.RegisterTime <= @rq2'                      END
    IF NULLIF(LTRIM(RTRIM(@zxksdm)), '') IS NOT NULL  BEGIN SET @Where += ' AND dd.InterfaceCode1 = @zxksdm'                    END
    IF NULLIF(LTRIM(RTRIM(@xmdm)), '') IS NOT NULL    BEGIN SET @Where += ' AND dfi.InterfaceCode1 = @xmdm'                     END
    IF NULLIF(LTRIM(RTRIM(@cureno)), '') IS NOT NULL   BEGIN SET @Where += ' AND vp.PatientCode = @cureno'                       END
    IF NULLIF(LTRIM(RTRIM(@cardno)), '') IS NOT NULL  BEGIN SET @Where += ' AND vp.PatientCode = @cardno'                       END



    -- ==================== 主查询SQL ====================
    SET @SQL = N'
SELECT
    ''3''                                         AS PIDAuthority,
    vp.PatientCode                                AS PIDNumber,
    vp.PatientCode                                AS VisitNumber,
    ''THIS4''                                     AS OrderPlacer,
    ''''                                          AS PlacerOrderType,
    ''''                                          AS PlacerOrderNumber,
    ''''                                          AS PlacerOrderStatus,
    vpfi.applyId                                  AS 申请单号,
    vp.PatientCode                                AS 病员号,
    ''''                                          AS 病人卡号,
    vp.PatientName                                AS 病人姓名,
    vp.Sex                                        AS 病人性别,
    ISNULL(vp.Age,0)                              AS 病人年龄,
    ''''                                          AS 病人科室,
    ''''                                          AS 病人病区,
    ''''                                          AS 病人床号,
    ISNULL(dictOperate.Number, '''')             AS 主治医生,
    vpfi.FeeItemName                              AS 检查项目,
    ''''                                          AS 检查状态,
    ''''                                          AS 结算状态,
    vpfi.RegisterTime                             AS 请求日期,
    ''0''                                         AS 门急诊标志,
    vpfi.FeeItemName                              AS 申请单名称,
    ''''                                          AS 收费状态,
    vpfi.applyId                                  AS 条形码,
    ''''                                          AS 临床路径标志
FROM VocaPatient vp
INNER JOIN VocaPatientFeeItem vpfi ON vp.ID_Patient = vpfi.ID_Patient
INNER JOIN DictFeeItem dfi         ON dfi.ID_FeeItem = vpfi.ID_FeeItem
INNER JOIN DictDepart dd           ON dd.ID_Depart = vpfi.ID_Depart
LEFT  JOIN DictUser dictOperate    ON dictOperate.ID_User = vpfi.ID_Operate
WHERE vp.IS_State < 6
AND dd.ServiceProviderType in (''PACS'',''LIS'')
  AND (vpfi.IS_FeeState IN (1,4) OR (vpfi.IS_FeeType = 1 AND ISNULL(vpfi.IS_FeeState,0) <> 2))
  AND ISNULL(vpfi.IS_LisState,''0'') IN (''0'',''1'')
  AND ISNULL(vpfi.IS_Examine,''0'') <> ''3''
  AND ISNULL(vpfi.IS_Suspend,'''') <> ''2'' '
  + ISNULL(@Where, N'')

    BEGIN TRY
        EXEC sp_executesql @SQL, 
            N'@hzxm VARCHAR(100), @rq1 DATETIME, @rq2 DATETIME, @zxksdm VARCHAR(100), @xmdm VARCHAR(100), @cureno VARCHAR(100), @cardno VARCHAR(100)',
            @hzxm=@hzxm,
            @rq1=@rq1,
            @rq2=@rq2,
            @zxksdm=@zxksdm,
            @xmdm=@xmdm,
            @cureno=@cureno,
            @cardno=@cardno
               
              

        SET @Rows = @@ROWCOUNT

        


    END TRY
    BEGIN CATCH
        SET @Success = 0
        SET @ErrorMsg = ERROR_MESSAGE()
        SELECT 'F' AS BZ, @ErrorMsg AS errmsg
    END CATCH

    -- ==================== 统一日志 ====================
    EXEC dbo.usp_sys_WriteInterfaceLog 
        @ProcName = 'usp_yjjk_getsqdlist', 
        @Params = NULL, 
        @Success = @Success, 
        @ReturnRows = @Rows, 
        @ErrorMsg = @ErrorMsg;

END
GO

PRINT '存储过程 usp_yjjk_getsqdlist 创建成功！'