

select * from VocaPatient

-- 读取病人基本信息
EXEC usp_yjjk_getbrxx  '3', '1', '26030300001', '0'       

select * from usp_yjjk_getbrxx_log


EXEC usp_yjjk_getbrlist '','','','','','2024011012:00:00','','','1','',''

select * from usp_yjjk_getbrlist_log

EXEC usp_yjjk_bgztxg  '3', '26020200001', '26020200001', '479814', '0', '0', '60', '-1', '0', '89', 'LIS', '800000000003T'

select * from usp_yjjk_bgztxg_log

exec usp_yjjk_getsqdlist 3,'','','','','','','','','','2021121212:00:00','',''

select * from usp_yjjk_getsqdlist_log


EXEC usp_yjjk_getwzxxm  '3', '-1', '8000211000', '2024012300:00:00', '2026012223:59:59', '0', '0'

select * from usp_yjjk_getwzxxm_log

EXEC usp_yjjk_jcbrfb  '24781501', '0', '26012900001', '26012900001', '26012900001', '', '测试003', '1', '33', '632', '山西省肿瘤体检中心', '', '', '', '00001', '00001', '2026012910:01:43', '101', '血液', '2026013016:35:46', '3', '全血', '479814', '管理员', '19', '检验科', '0', '1', 'SYSME-XN1000血液分析仪A', '1', '2026013016:25:48', '管理员', '0', '479814', '2026013016:25:48', ''

select * from usp_yjjk_jcbrfb_log

EXEC usp_yjjk_jg_huishou  '-1', '101', 'LIS'

select * from usp_yjjk_jg_huishou_log

EXEC usp_yjjk_yjjgfb  'LIS', '3', '26020900002', '93', '101', '血液', '10100001', '白细胞计数', '1.00', '19', '479814', '2026021216:15:44', '*10^9/L', '1', '4.10～11.00', '1', 'Z0001', '24781501', '0'

select * from usp_yjjk_yjjgfb_log


