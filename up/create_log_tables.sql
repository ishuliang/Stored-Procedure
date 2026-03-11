-- =============================================
-- 日志表创建脚本
-- 为每个存储过程创建对应的日志表
-- 表名格式：存储过程名 + _log
-- =============================================

-- =============================================
-- 1. up_interface_RIS_WN_bgztxg 日志表
-- =============================================
IF OBJECT_ID('dbo.up_interface_RIS_WN_bgztxg_log', 'U') IS NOT NULL
    DROP TABLE dbo.up_interface_RIS_WN_bgztxg_log
GO

CREATE TABLE dbo.up_interface_RIS_WN_bgztxg_log
(
    id           INT IDENTITY(1,1) PRIMARY KEY,
    brlb         VARCHAR(100),
    patid        VARCHAR(100),
    curno        VARCHAR(100),
    ysdm         VARCHAR(100),
    bgzt         VARCHAR(100),
    txzt         VARCHAR(100),
    jczt         VARCHAR(100),
    bgdh         VARCHAR(100),
    bglx         VARCHAR(100),
    logno        VARCHAR(100),
    lis          VARCHAR(100),
    txm          VARCHAR(100),
    result       VARCHAR(10),
    errormessage VARCHAR(MAX),
    create_time  DATETIME DEFAULT GETDATE()
)
GO

PRINT '表 up_interface_RIS_WN_bgztxg_log 创建成功！'
GO

-- =============================================
-- 2. up_interface_RIS_WN_getbrlist 日志表
-- =============================================
IF OBJECT_ID('dbo.up_interface_RIS_WN_getbrlist_log', 'U') IS NOT NULL
    DROP TABLE dbo.up_interface_RIS_WN_getbrlist_log
GO

CREATE TABLE dbo.up_interface_RIS_WN_getbrlist_log
(
    id           INT IDENTITY(1,1) PRIMARY KEY,
    brlb         VARCHAR(100),
    hzxm         VARCHAR(100),
    ksdm         VARCHAR(100),
    bqdm         VARCHAR(100),
    cwdm         VARCHAR(100),
    rq1          VARCHAR(100),
    rq2          VARCHAR(100),
    fph          VARCHAR(100),
    codetype     VARCHAR(100),
    zxksdm       VARCHAR(100),
    jzbrbz       VARCHAR(100),
    result       VARCHAR(10),
    errormessage VARCHAR(MAX),
    create_time  DATETIME DEFAULT GETDATE()
)
GO

PRINT '表 up_interface_RIS_WN_getbrlist_log 创建成功！'
GO

-- =============================================
-- 3. up_interface_RIS_WN_getbrxx 日志表
-- =============================================
IF OBJECT_ID('dbo.up_interface_RIS_WN_getbrxx_log', 'U') IS NOT NULL
    DROP TABLE dbo.up_interface_RIS_WN_getbrxx_log
GO

CREATE TABLE dbo.up_interface_RIS_WN_getbrxx_log
(
    id           INT IDENTITY(1,1) PRIMARY KEY,
    brlb         VARCHAR(100),
    codetype     VARCHAR(100),
    code         VARCHAR(100),
    yebz         VARCHAR(100),
    cybz         VARCHAR(100),
    result       VARCHAR(10),
    errormessage VARCHAR(MAX),
    create_time  DATETIME DEFAULT GETDATE()
)
GO

PRINT '表 up_interface_RIS_WN_getbrxx_log 创建成功！'
GO

-- =============================================
-- 4. up_interface_RIS_WN_getsqdlist 日志表
-- =============================================
IF OBJECT_ID('dbo.up_interface_RIS_WN_getsqdlist_log', 'U') IS NOT NULL
    DROP TABLE dbo.up_interface_RIS_WN_getsqdlist_log
GO

CREATE TABLE dbo.up_interface_RIS_WN_getsqdlist_log
(
    id           INT IDENTITY(1,1) PRIMARY KEY,
    brlb         VARCHAR(100),
    cureno       VARCHAR(100),
    execDeptCode VARCHAR(100),
    rq1          VARCHAR(100),
    rq2          VARCHAR(100),
    result       VARCHAR(10),
    errormessage VARCHAR(MAX),
    create_time  DATETIME DEFAULT GETDATE()
)
GO

PRINT '表 up_interface_RIS_WN_getsqdlist_log 创建成功！'
GO

-- =============================================
-- 5. up_interface_RIS_WN_getsqdxx 日志表
-- =============================================
IF OBJECT_ID('dbo.up_interface_RIS_WN_getsqdxx_log', 'U') IS NOT NULL
    DROP TABLE dbo.up_interface_RIS_WN_getsqdxx_log
GO

CREATE TABLE dbo.up_interface_RIS_WN_getsqdxx_log
(
    id           INT IDENTITY(1,1) PRIMARY KEY,
    brlb         VARCHAR(100),
    patid        VARCHAR(100),
    cureno       VARCHAR(100),
    sqdh         VARCHAR(100),
    result       VARCHAR(10),
    errormessage VARCHAR(MAX),
    create_time  DATETIME DEFAULT GETDATE()
)
GO

PRINT '表 up_interface_RIS_WN_getsqdxx_log 创建成功！'
GO

-- =============================================
-- 6. up_interface_RIS_WN_getwzxxm 日志表
-- =============================================
IF OBJECT_ID('dbo.up_interface_RIS_WN_getwzxxm_log', 'U') IS NOT NULL
    DROP TABLE dbo.up_interface_RIS_WN_getwzxxm_log
GO

CREATE TABLE dbo.up_interface_RIS_WN_getwzxxm_log
(
    id           INT IDENTITY(1,1) PRIMARY KEY,
    brlb         VARCHAR(100),
    patid        VARCHAR(100),
    curno        VARCHAR(100),
    rq1          VARCHAR(100),
    rq2          VARCHAR(100),
    sqdxh        VARCHAR(100),
    yexh         VARCHAR(100),
    result       VARCHAR(10),
    errormessage VARCHAR(MAX),
    create_time  DATETIME DEFAULT GETDATE()
)
GO

PRINT '表 up_interface_RIS_WN_getwzxxm_log 创建成功！'
GO

-- =============================================
-- 7. up_interface_RIS_WN_jcbrfb 日志表
-- =============================================
IF OBJECT_ID('dbo.up_interface_RIS_WN_jcbrfb_log', 'U') IS NOT NULL
    DROP TABLE dbo.up_interface_RIS_WN_jcbrfb_log
GO

CREATE TABLE dbo.up_interface_RIS_WN_jcbrfb_log
(
    id           INT IDENTITY(1,1) PRIMARY KEY,
    repno        VARCHAR(100),
    reqno        VARCHAR(100),
    syxh         VARCHAR(100),
    patid        VARCHAR(100),
    blh          VARCHAR(100),
    cardno       VARCHAR(100),
    hzxm         VARCHAR(100),
    sex          VARCHAR(100),
    age          VARCHAR(100),
    sjksdm       VARCHAR(100),
    sjksmc       VARCHAR(100),
    bqdm         VARCHAR(100),
    bqmc         VARCHAR(100),
    cwdm         VARCHAR(100),
    sjysdm       VARCHAR(100),
    sjysxm       VARCHAR(100),
    sjrq         VARCHAR(100),
    replb        VARCHAR(100),
    replbmc      VARCHAR(100),
    reprq        VARCHAR(100),
    xtbz         VARCHAR(100),
    jcbw         VARCHAR(100),
    jcysdm       VARCHAR(100),
    jcysxm       VARCHAR(100),
    jcksdm       VARCHAR(100),
    jcksmc       VARCHAR(100),
    isly         VARCHAR(100),
    wjbz         VARCHAR(100),
    instname     VARCHAR(100),
    techno       VARCHAR(100),
    cyrq         VARCHAR(100),
    shys         VARCHAR(100),
    crbz         VARCHAR(100),
    shysdm       VARCHAR(100),
    bbjsrq       VARCHAR(100),
    memo         VARCHAR(100),
    result       VARCHAR(10),
    errormessage VARCHAR(MAX),
    create_time  DATETIME DEFAULT GETDATE()
)
GO

PRINT '表 up_interface_RIS_WN_jcbrfb_log 创建成功！'
GO

-- =============================================
-- 8. up_interface_RIS_WN_jg_huishou 日志表
-- =============================================
IF OBJECT_ID('dbo.up_interface_RIS_WN_jg_huishou_log', 'U') IS NOT NULL
    DROP TABLE dbo.up_interface_RIS_WN_jg_huishou_log
GO

CREATE TABLE dbo.up_interface_RIS_WN_jg_huishou_log
(
    id           INT IDENTITY(1,1) PRIMARY KEY,
    repno        VARCHAR(100),
    replb        VARCHAR(100),
    syscode      VARCHAR(100),
    result       VARCHAR(10),
    errormessage VARCHAR(MAX),
    create_time  DATETIME DEFAULT GETDATE()
)
GO

PRINT '表 up_interface_RIS_WN_jg_huishou_log 创建成功！'
GO

-- =============================================
-- 9. up_interface_RIS_WN_yjjgfb 日志表
-- =============================================
IF OBJECT_ID('dbo.up_interface_RIS_WN_yjjgfb_log', 'U') IS NOT NULL
    DROP TABLE dbo.up_interface_RIS_WN_yjjgfb_log
GO

CREATE TABLE dbo.up_interface_RIS_WN_yjjgfb_log
(
    id           INT IDENTITY(1,1) PRIMARY KEY,
    syscode      VARCHAR(100),
    cflb         VARCHAR(100),
    patid        VARCHAR(100),
    cfxh         VARCHAR(100),
    xmlbdm       VARCHAR(100),
    xmlbmc       VARCHAR(100),
    xmdm         VARCHAR(100),
    xmmc         VARCHAR(500),
    xmjg         VARCHAR(MAX),
    ksdm         VARCHAR(100),
    ysdm         VARCHAR(100),
    wcsj         VARCHAR(100),
    xmdw         VARCHAR(100),
    jglx         VARCHAR(100),
    jgckz        VARCHAR(100),
    gdbz         VARCHAR(100),
    dyxh         VARCHAR(100),
    applyno      VARCHAR(100),
    crbz         VARCHAR(100),
    result       VARCHAR(10),
    errormessage VARCHAR(MAX),
    create_time  DATETIME DEFAULT GETDATE()
)
GO

PRINT '表 up_interface_RIS_WN_yjjgfb_log 创建成功！'
GO

-- =============================================
-- 10. up_interface_RIS_WN_yjqr 日志表
-- =============================================
IF OBJECT_ID('dbo.up_interface_RIS_WN_yjqr_log', 'U') IS NOT NULL
    DROP TABLE dbo.up_interface_RIS_WN_yjqr_log
GO

CREATE TABLE dbo.up_interface_RIS_WN_yjqr_log
(
    id           INT IDENTITY(1,1) PRIMARY KEY,
    brlb         VARCHAR(100),
    patid        VARCHAR(100),
    curno        VARCHAR(100),
    zxksdm       VARCHAR(100),
    zxysdm       VARCHAR(100),
    logno        VARCHAR(100),
    applyno      VARCHAR(100),
    groupno      VARCHAR(100),
    xmlb         VARCHAR(100),
    xmdm         VARCHAR(100),
    xmdj         VARCHAR(100),
    xmsl         VARCHAR(100),
    xmstatus     VARCHAR(100),
    sfflag       VARCHAR(100),
    bgdh         VARCHAR(100),
    bglx         VARCHAR(100),
    result       VARCHAR(10),
    errormessage VARCHAR(MAX),
    create_time  DATETIME DEFAULT GETDATE()
)
GO

PRINT '表 up_interface_RIS_WN_yjqr_log 创建成功！'
GO

-- =============================================
-- 3. up_interface_RIS_WN_getbrxx 日志表
-- =============================================
IF OBJECT_ID('dbo.up_interface_RIS_WN_Getbrxx_log', 'U') IS NOT NULL
    DROP TABLE dbo.up_interface_RIS_WN_Getbrxx_log
GO

CREATE TABLE dbo.up_interface_RIS_WN_Getbrxx_log
(
    id           INT IDENTITY(1,1) PRIMARY KEY,
    brlb         VARCHAR(100),
    codetype     VARCHAR(100),
    code         VARCHAR(100),
    yebz         VARCHAR(100),
    cybz         VARCHAR(100),
    result       VARCHAR(10),
    errormessage VARCHAR(MAX),
    create_time  DATETIME DEFAULT GETDATE()
)
GO

PRINT '所有日志表创建完成！'
GO



