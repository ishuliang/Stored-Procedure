USE master;
GO

-- 1. 创建登录（如果已经存在就跳过）
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'helian_yj')
BEGIN
    CREATE LOGIN helian_yj WITH PASSWORD = 'helianyj@2025';  -- 改成你自己的强密码
    -- 如果查询了系统级别信息需要开放权限
    GRANT VIEW SERVER STATE TO helian_yj
END
GO


-- 2. 切换到业务数据库
USE [sxzlhems];   -- ← 改成你的真实数据库名
GO

-- 3. 创建数据库用户
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'helian_yj')
    CREATE USER helian_yj FOR LOGIN helian_yj;
GO

-- 4. 最简单直接的“所有权链”方案（推荐给内部或可信用户）
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.interface_state TO helian_yj
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.InterfaceCallLog TO helian_yj;
GRANT SELECT ON dbo.VocaPatient TO helian_yj;
GRANT SELECT ON dbo.VocaPatientFeeItem TO helian_yj;
GRANT SELECT ON dbo.VocaPatientExamItem TO helian_yj;
GRANT SELECT ON dbo.DictFeeItem TO helian_yj;
GRANT SELECT ON dbo.VocaPatientExtend TO helian_yj;
GRANT SELECT ON dbo.DictDepart TO helian_yj;
GRANT SELECT ON dbo.DictSampleType TO helian_yj;
GRANT SELECT ON dbo.DictUser TO helian_yj;
GRANT SELECT ON dbo.DictSampleType TO helian_yj;



-- 授予执行权限
GRANT EXECUTE ON dbo.usp_yjjk_getbrxx TO helian_yj;
GRANT EXECUTE ON dbo.usp_yjjk_getbrlist TO helian_yj;
GRANT EXECUTE ON dbo.usp_yjjk_getwzxxm TO helian_yj;
GRANT EXECUTE ON dbo.usp_yjjk_yjqr TO helian_yj;
GRANT EXECUTE ON dbo.usp_yjjk_jcbrfb TO helian_yj;
GRANT EXECUTE ON dbo.usp_yjjk_yjjgfb TO helian_yj;
GRANT EXECUTE ON dbo.usp_yjjk_jg_huishou TO helian_yj;
GRANT EXECUTE ON dbo.usp_yjjk_bgztxg TO helian_yj;
GRANT EXECUTE ON dbo.usp_yjjk_getsqdlist TO helian_yj;
GRANT EXECUTE ON dbo.usp_yjjk_getsqdxx TO helian_yj;

-- 授予查看源码权限
GRANT VIEW DEFINITION ON dbo.usp_yjjk_getbrxx TO helian_yj;
GRANT VIEW DEFINITION ON dbo.usp_yjjk_getbrlist TO helian_yj;
GRANT VIEW DEFINITION ON dbo.usp_yjjk_getwzxxm TO helian_yj;
GRANT VIEW DEFINITION ON dbo.usp_yjjk_yjqr TO helian_yj;
GRANT VIEW DEFINITION ON dbo.usp_yjjk_jcbrfb TO helian_yj;
GRANT VIEW DEFINITION ON dbo.usp_yjjk_yjjgfb TO helian_yj;
GRANT VIEW DEFINITION ON dbo.usp_yjjk_jg_huishou TO helian_yj;
GRANT VIEW DEFINITION ON dbo.usp_yjjk_bgztxg TO helian_yj;
GRANT VIEW DEFINITION ON dbo.usp_yjjk_getsqdlist TO helian_yj;
GRANT VIEW DEFINITION ON dbo.usp_yjjk_getsqdxx TO helian_yj;

-- 超声检查

-- 授予执行权限
GRANT EXECUTE ON dbo.up_interface_RIS_WN_getbrxx TO helian_yj;
GRANT EXECUTE ON dbo.up_interface_RIS_WN_getbrlist TO helian_yj;
GRANT EXECUTE ON dbo.up_interface_RIS_WN_getwzxxm TO helian_yj;
GRANT EXECUTE ON dbo.up_interface_RIS_WN_yjqr TO helian_yj;
GRANT EXECUTE ON dbo.up_interface_RIS_WN_jcbrfb TO helian_yj;
GRANT EXECUTE ON dbo.up_interface_RIS_WN_yjjgfb TO helian_yj;
GRANT EXECUTE ON dbo.up_interface_RIS_WN_jg_huishou TO helian_yj;
GRANT EXECUTE ON dbo.up_interface_RIS_WN_bgztxg TO helian_yj;
GRANT EXECUTE ON dbo.up_interface_RIS_WN_getsqdlist TO helian_yj;
GRANT EXECUTE ON dbo.up_interface_RIS_WN_getsqdxx TO helian_yj;

-- 授予查看源码权限
GRANT VIEW DEFINITION ON dbo.up_interface_RIS_WN_getbrxx TO helian_yj;
GRANT VIEW DEFINITION ON dbo.up_interface_RIS_WN_getbrlist TO helian_yj;
GRANT VIEW DEFINITION ON dbo.up_interface_RIS_WN_getwzxxm TO helian_yj;
GRANT VIEW DEFINITION ON dbo.up_interface_RIS_WN_yjqr TO helian_yj;
GRANT VIEW DEFINITION ON dbo.up_interface_RIS_WN_jcbrfb TO helian_yj;
GRANT VIEW DEFINITION ON dbo.up_interface_RIS_WN_yjjgfb TO helian_yj;
GRANT VIEW DEFINITION ON dbo.up_interface_RIS_WN_jg_huishou TO helian_yj;
GRANT VIEW DEFINITION ON dbo.up_interface_RIS_WN_bgztxg TO helian_yj;
GRANT VIEW DEFINITION ON dbo.up_interface_RIS_WN_getsqdlist TO helian_yj;
GRANT VIEW DEFINITION ON dbo.up_interface_RIS_WN_getsqdxx TO helian_yj;


GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.up_interface_RIS_WN_getbrxx_log TO helian_yj
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.up_interface_RIS_WN_getbrlist_log TO helian_yj;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.up_interface_RIS_WN_getwzxxm_log TO helian_yj;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.up_interface_RIS_WN_yjqr_log TO helian_yj;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.up_interface_RIS_WN_jcbrfb_log TO helian_yj;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.up_interface_RIS_WN_yjjgfb_log TO helian_yj;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.up_interface_RIS_WN_jg_huishou_log TO helian_yj;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.up_interface_RIS_WN_bgztxg_log TO helian_yj;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.up_interface_RIS_WN_getsqdlist_log TO helian_yj;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.up_interface_RIS_WN_getsqdxx_log TO helian_yj;
