select * from DictFeeItem where FeeItemName='血细胞分析'

EXEC usp_yjjk_getwzxxm  '3', '-1', '8000211000', '2024012300:00:00', '2026012223:59:59', '0', '0'

select * from usp_yjjk_getwzxxm_log order by create_time desc

EXEC usp_yjjk_getbrxx  '3', '2', '8000211000', '0'

select * from usp_yjjk_getbrxx_log order by create_time desc

EXEC usp_yjjk_yjqr '3','26012100001'

select * from usp_yjjk_yjqr_log  order by create_time desc

EXEC usp_yjjk_bgztxg  '3', '26020200001', '26020200001', '479814', '0', '0', '20', '-1', '0', '89', 'LIS', '8000211000'

EXEC usp_yjjk_bgztxg  '3', '26020200001', '26020200001', '479814', '0', '0', '60', '3146693', '0', '89', 'LIS', '8000211000'

select * from usp_yjjk_bgztxg_log  order by create_time desc

EXEC usp_yjjk_jcbrfb  '8000211000', '0', '26020200001', '26020200001', '26020200001', '', '测试003', '1', '33', '632', '山西省肿瘤体检中心', '', '', '', '00001', '00001', '2026012910:01:43', '101', '血液', '2026013016:35:46', '3', '全血', '479814', '管理员', '19', '检验科', '0', '1', 'SYSME-XN1000血液分析仪A', '1', '2026013016:25:48', '管理员', '0', '479814', '2026013016:25:48', ''

select * from usp_yjjk_jcbrfb_log  order by create_time desc

EXEC usp_yjjk_yjjgfb  'LIS', '3', '26020200001', '93', '101', '血液', '10100001', '白细胞计数', '1.00', '19', '479814', '2026021216:15:44', '*10^9/L', '1', '4.10～11.00', '1', 'Z0001', '3146693', '0'


SELECT * from usp_yjjk_yjjgfb_log  order by create_time desc

select * from ReportData


EXEC usp_yjjk_jg_huishou  '3146693', '101', 'LIS'

select * from usp_yjjk_jg_huishou_log  order by create_time desc




