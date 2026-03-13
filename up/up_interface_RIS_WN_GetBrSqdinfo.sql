/*--------------------------------------------------------------------------------------
<描述>： 获取病人申请单信息
<测试>： exec up_interface_RIS_WN_GetBrSqdinfo '2', '26031300001' ,'26031300001','80000000173'
<日志>： select * from up_interface_RIS_WN_GetBrSqdinfo_log order by create_time desc
--------------------------------------------------------------------------------------*/            
ALTER PROCEDURE [dbo].[up_interface_RIS_WN_GetBrSqdinfo]    
	@brlb VARCHAR(100) = NULL,                  -- 病人类别 0 门诊 1 住院
	@PatientID VARCHAR(100) = NULL,         -- 病人本次检查号
	@Cureno VARCHAR(100) = NULL,         -- 病人唯一号 门诊 ghsjh 住院
	@Sqdh VARCHAR(100) = NULL          -- 申请单号	
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE 
        @LogId       INT = 0,
        @Success     BIT           = 1,
        @Rows        INT           = 0,
        @ErrorMsg    NVARCHAR(1000) = NULL,
        @ExecutedSQL NVARCHAR(MAX) = N'',
        @SQL         NVARCHAR(MAX) = N'',
        @Where       NVARCHAR(MAX) = N'',
        @Debug       BIT         = 1  -- 调试模式，0为关闭，1为开启

    -- 插入日志记录
    INSERT INTO dbo.up_interface_RIS_WN_GetBrSqdinfo_log (brlb, patid, cureno, sqdh)
    VALUES (@brlb, @PatientID, @Cureno, @Sqdh);
    SET @LogId = SCOPE_IDENTITY();

    -- ==================== 动态条件（参数化，永不报错）===================
    IF @Brlb IS NULL OR (@Brlb <> 2)
            RAISERROR('病人类别不正确！超声检查为2', 16, 1)

    IF  ISNULL(@PatientID, '') <> '' SET @Where += ' AND vp.PatientCode = @PatientID'
    IF  ISNULL(@Cureno, '') <> '' SET @Where += ' AND vp.PatientCode = @Cureno'
    IF  ISNULL(@Sqdh, '') <> '' SET @Where += ' AND vpfi.applyId = @Sqdh'

    -- ==================== 主查询SQL ====================
    SET @SQL = N'
                SELECT
                    vp.PatientCode                                                AS PatientID,
                    vp.PatientCode                                       AS Cureno,
                    @brlb                                                 AS brlb,
                    ''''                                                 AS 总体描述,
                    ''健康查体''                                                 AS 检查目的,
                    '''' as 病史资料,
                    ''体检超声''                              AS SqdName,
                    vpfi.applyId as Sqdh,
                    '''' as ClinicDesc,
                    '''' as ZS,
                    '''' as JWS,
                    '''' as XBS,
                    '''' as 申请费用,
                    '''' as Remark,
                    ISNULL(dictOperate.Number, '''') as ApplyDoctor,
                    ISNULL(dictOperate.UserName, '''') as ApplyDoctorName,
                    vpfi.RegisterTime as ApplyTime,
                    ''体检超声''  as 收费项目,
                    '''' as JCBZ,
                    vpfi.FeeItemName  as JCXM,
                    dfi.outFeeItemCode                                                    AS BW
                
                FROM VocaPatient vp
                INNER JOIN VocaPatientFeeItem vpfi ON vp.ID_Patient = vpfi.ID_Patient
                INNER JOIN DictFeeItem dfi         ON dfi.ID_FeeItem = vpfi.ID_FeeItem
                INNER JOIN DictDepart dd           ON dd.ID_Depart = vpfi.ID_Depart
                LEFT  JOIN DictUser dictOperate    ON dictOperate.ID_User = vpfi.ID_Operate

                WHERE vp.IS_State < 6
                AND dd.ServiceProviderType in (''WN'')
                AND dd.InterfaceCode1 = ''024''
                AND (vpfi.IS_FeeState IN (1,4) 
                    OR (vpfi.IS_FeeType = 1 AND ISNULL(vpfi.IS_FeeState,0) <> 2))
                AND ISNULL(vpfi.IS_Examine,''0'') <> ''3''
                AND ISNULL(vpfi.IS_Suspend,'''') <> ''2''
                 '
                + ISNULL(@Where, N'')
    
    
    BEGIN TRY

        IF @Debug = 1
        BEGIN
            DECLARE @DebugSQL NVARCHAR(MAX) = @SQL

            SET @DebugSQL = REPLACE(@DebugSQL, '@brlb',  ISNULL('''' + @brlb + '''' , 'NULL'))
            SET @DebugSQL = REPLACE(@DebugSQL, '@PatientID',  ISNULL('''' + @PatientID + '''' , 'NULL'))
            SET @DebugSQL = REPLACE(@DebugSQL, '@Cureno',   ISNULL('''' + @Cureno + '''', 'NULL'))
            SET @DebugSQL = REPLACE(@DebugSQL, '@Sqdh',   ISNULL('''' + @Sqdh + '''', 'NULL'))
            PRINT @DebugSQL
        END      

        -- 执行查询
        EXEC sp_executesql @SQL, 
            N'@brlb VARCHAR(100), @PatientID VARCHAR(100), @Cureno VARCHAR(100), @Sqdh VARCHAR(100)',
            @brlb = @brlb,
            @PatientID = @PatientID,
            @Cureno = @Cureno,
            @Sqdh = @Sqdh

        SET @Rows = @@ROWCOUNT

       
    END TRY
    BEGIN CATCH
        SET @Success = 0
        SET @ErrorMsg = ERROR_MESSAGE()
        SELECT 'F' AS BZ, @ErrorMsg AS errmsg
        
    END CATCH

    -- 更新日志记录结果
    UPDATE dbo.up_interface_RIS_WN_GetBrSqdinfo_log
    SET result = CASE WHEN @Success = 1 THEN '200' ELSE '-1' END,
        errormessage = CASE WHEN @Success = 1 THEN 'success' ELSE @ErrorMsg END
    WHERE id = @LogId;

END
GO

PRINT '存储过程 up_interface_RIS_WN_GetBrSqdinfo 更新成功！'
