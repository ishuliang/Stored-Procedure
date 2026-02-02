USE [HEMS_V5]
GO

IF OBJECT_ID('dbo.usp_sys_WriteInterfaceLog', 'P') IS NOT NULL
    DROP PROCEDURE dbo.usp_sys_WriteInterfaceLog
GO

-- =============================================
-- 通用接口日志记录存储过程
-- =============================================
CREATE PROCEDURE dbo.usp_sys_WriteInterfaceLog
(
    @ProcName     VARCHAR(100),   -- 存储过程名称
    @Params       NVARCHAR(MAX) = NULL, -- 可选：手动传入的参数。如果为NULL，将自动捕获原始执行语句
    @Success      BIT,            -- 是否成功（1-成功，0-失败）
    @ReturnRows   INT,            -- 返回/更新行数
    @ErrorMsg     NVARCHAR(MAX) = NULL -- 错误信息
)
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @ClientIP NVARCHAR(50);
    DECLARE @ActualParams NVARCHAR(MAX) = @Params;
    
    -- 获取调用者IP
    SELECT @ClientIP = client_net_address 
    FROM sys.dm_exec_connections 
    WHERE session_id = @@SPID;

    -- 如果没有手动传入参数，自动获取原始执行语句（支持直接复制执行）
    IF @ActualParams IS NULL OR @ActualParams = ''
    BEGIN
        -- 尝试从输入缓冲区获取原始 SQL 语句
        SELECT @ActualParams = event_info 
        FROM sys.dm_exec_input_buffer(@@SPID, NULL);
        
        -- 如果版本较低不支持 dm_exec_input_buffer，可以考虑 DBCC INPUTBUFFER 的备选逻辑
        -- 但此处假定环境支持较新版本
    END

    -- 写入日志表
    INSERT INTO dbo.InterfaceCallLog
        (ProcName, Params, ClientIP, CallTime, Success, ReturnRows, ErrorMessage, ExecUser)
    VALUES
        (@ProcName, @ActualParams, @ClientIP, GETDATE(), @Success, @ReturnRows, @ErrorMsg, ORIGINAL_LOGIN());
END
GO

PRINT '存储过程 dbo.usp_sys_WriteInterfaceLog 创建成功！'
