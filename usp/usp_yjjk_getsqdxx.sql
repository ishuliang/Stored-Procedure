 USE [HEMS_V5]
GO

-- =============================================
-- 获取体检影像申请单信息（PACS专用）
-- =============================================
IF OBJECT_ID('dbo.
', 'P') IS NOT NULL
    DROP PROCEDURE dbo.usp_yjjk_getsqdxx
GO

CREATE PROCEDURE dbo.usp_yjjk_getsqdxx
(
    @brlb     VARCHAR(10) = '3',        -- 固定传3（体检）
    @patid    VARCHAR(50) = NULL,       -- 病人唯一标识（体检号）
    @cureno   VARCHAR(50) = NULL,       -- 就诊流水号（可与patid相同）
    @sqdh     INT         = NULL        -- 申请单号（可选，用于精确查询）
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE 
        @LogId       INT = 0,
        @Success     BIT           = 1,
        @Rows        INT           = 0,
        @ErrorMsg    NVARCHAR(1000) = NULL,
        @ClientIP    NVARCHAR(50)  = NULL,
        @LogParams   NVARCHAR(MAX) = N'',
        @ExecutedSQL NVARCHAR(MAX) = N'',
        @SQL         NVARCHAR(MAX) = N'',
        @Where       NVARCHAR(MAX) = N'',
        @Where2      NVARCHAR(MAX) = N'',
        @Params      NVARCHAR(MAX) = N'@patid VARCHAR(50), @cureno VARCHAR(50), @sqdh INT'

    -- 插入日志记录
    INSERT INTO dbo.usp_yjjk_getsqdxx_log (brlb, patid, cureno, sqdh)
    VALUES (@brlb, @patid, @cureno, @sqdh);
    SET @LogId = SCOPE_IDENTITY();

    -- 获取调用者IP
    SELECT @ClientIP = client_net_address 
    FROM sys.dm_exec_connections 
    WHERE session_id = @@SPID

    -- ==================== 日志参数（所有值带单引号，超级清晰）===================
    SET @LogParams = 
        'brlb='''   + ISNULL(@brlb,'')     + '''' +
        ',patid=''' + ISNULL(@patid,'')    + '''' +
        ',cureno='''+ ISNULL(@cureno,'')   + '''' +
        ',sqdh='''  + ISNULL(CAST(@sqdh AS VARCHAR(20)),'') + ''''

    -- ==================== 动态条件（参数化，永不报错）===================
    IF @patid  IS NOT NULL SET @Where += ' AND vp.PatientCode = @patid'
    IF @cureno IS NOT NULL SET @Where += ' AND vp.PatientCode = @cureno'
    IF @sqdh   IS NOT NULL SET @Where2 += ' AND vpfi2.ApplyID = @sqdh'

    -- ==================== 主查询SQL ====================
    SET @SQL = N'
                SELECT
                    ''3''                                                AS brlb,
                    vp.PatientCode                                       AS patid,
                    vp.PatientCode                                       AS cureno,
                    ''''                                                 AS memo,

                    -- 关键：把同一病人的所有收费项目用换行符拼接
                    STUFF((
                        SELECT CHAR(13) + CHAR(10) + vpfi2.FeeItemName
                        FROM VocaPatientFeeItem vpfi2
                        INNER JOIN DictFeeItem dfi2 ON dfi2.ID_FeeItem = vpfi2.ID_FeeItem
                        WHERE vpfi2.ID_Patient = vp.ID_Patient
                        AND vpfi2.IS_FeeState IN (1,4)   -- 可根据实际业务加过滤条件
                '+@Where2+'
                        ORDER BY vpfi2.RegisterTime      -- 可选：按申请时间排序
                        FOR XML PATH(''''), TYPE).value(''.'', ''NVARCHAR(MAX)'')
                    , 1, 2, '''')                                        AS [收费项目],

                    ''''                                                 AS 总体描述

                FROM VocaPatient vp
                INNER JOIN VocaPatientFeeItem vpfi ON vp.ID_Patient = vpfi.ID_Patient
                INNER JOIN DictFeeItem dfi         ON dfi.ID_FeeItem = vpfi.ID_FeeItem
                INNER JOIN DictDepart dd           ON dd.ID_Depart = vpfi.ID_Depart
                LEFT  JOIN DictUser dictOperate    ON dictOperate.ID_User = vpfi.ID_Operate

                WHERE vp.IS_State < 6
                AND dd.ServiceProviderType in (''PACS'',''LIS'')
                AND (vpfi.IS_FeeState IN (1,4) 
                    OR (vpfi.IS_FeeType = 1 AND ISNULL(vpfi.IS_FeeState,0) <> 2))
                AND ISNULL(vpfi.IS_Examine,''0'') <> ''3''
                AND ISNULL(vpfi.IS_Suspend,'''') <> ''2''
                 '
                + ISNULL(@Where, N'')
                    + N'
                GROUP BY 
                    vp.PatientCode, vp.ID_Patient
                ORDER BY vp.PatientCode'
    PRINT @SQL;
    BEGIN TRY
        -- 执行查询
        EXEC sp_executesql @SQL, @Params,
             @patid = @patid,
             @cureno = @cureno,
             @sqdh = @sqdh

        SET @Rows = @@ROWCOUNT

       
    END TRY
    BEGIN CATCH
        SET @Success = 0
        SET @ErrorMsg = ERROR_MESSAGE()
        SELECT 'F' AS BZ, @ErrorMsg AS errmsg
        
    END CATCH

    -- 更新日志记录结果
    UPDATE dbo.usp_yjjk_getsqdxx_log 
    SET result = CASE WHEN @Success = 1 THEN '200' ELSE '-1' END,
        errormessage = CASE WHEN @Success = 1 THEN 'success' ELSE @ErrorMsg END
    WHERE id = @LogId;

END
GO

PRINT '存储过程 usp_yjjk_getsqdxx 创建成功！'