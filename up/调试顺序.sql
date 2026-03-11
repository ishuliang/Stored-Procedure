TODO： 
1. 修改申请单的执行科室
2. 申请单要过滤掉非超声的项目
3. getwzxxm BW, JCXM

EXEC up_interface_RIS_WN_Getbrxx '2','1','26030300001','',''


exec up_interface_RIS_WN_getsqdlist '2','26030300001','024','2026-02-08','2026-03-11'


exec up_interface_RIS_WN_getwzxxm '3','26030300001','26030300001',''