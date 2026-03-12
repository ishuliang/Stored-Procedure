TODO： 
1. 修改申请单的执行科室
2. 申请单要过滤掉非超声的项目
3. getwzxxm BW, JCXM

-- 0312
1. 申请科室编码是156

-- 病人基本信息   
EXEC up_interface_RIS_WN_Getbrxx '2','1','26030300001','',''

-- 申请单列表   
exec up_interface_RIS_WN_getsqdlist '2','26030300001','024','2026-02-08','2026-03-11'

-- 申请单详情   
exec up_interface_RIS_WN_GetBrSqdinfo '2', '26030300001' ,'26030300001',''

-- 未执行医嘱项目
exec up_interface_RIS_WN_getwzxxm '3','26030300001','26030300001',''



select * from interface_state where patient_code= '26030300001'

select IS_LisState,* from VocaPatientFeeItem where applyid='80000000096'