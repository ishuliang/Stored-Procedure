IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'jyfjy')

BEGIN

 CREATE LOGIN jyfjy WITH PASSWORD = 'Jy@2026#fjy'; 
END

GO


IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'jyfjy')

 CREATE USER jyfjy FOR LOGIN jyfjy;

GO

GRANT SELECT ON dbo.V_JYFJY TO jyfjy;

create VIEW V_JYFJY AS
SELECT 
vp.patientcode AS patietnId,
vp.patientname AS patientName,
CONCAT ( vp.age, '岁' ) AS patientAge,
CASE
		
		WHEN vp.Sex IS NULL 
		OR vp.Sex = 0 THEN
			'未录' 
			WHEN vp.Sex = 1 THEN
			'男' 
			WHEN vp.Sex = 2 THEN
			'女' 
			WHEN vp.Sex = 3 THEN
			'未知' ELSE '未录' -- 兜底，防止异常值
			
		END AS patientGender,
		vp.phone AS patientMobile,
		'' AS groupCode,
		'体检' AS source,
		'待查' AS diagnosis,
		vpfi.applyId AS orderNo,
		ISNULL( dictOperate.UserName, '' ) AS requestDoctor,
		'体检科' AS requestDept,
		dd.DepartName AS executeDept,
		vpfi.barCode AS itemBarcode,
-- 只有 code2 = '1' 时才拆分 code3，否则使用原来的 ItemCode
COALESCE ( s.Value, dfi.InterfaceCode1 ) AS ItemCode,
COALESCE ( dfi_new.FeeItemName, dfi.FeeItemName ) AS ItemName,
ISNULL( dst.SampleName, '' ) AS itemType,
ISNULL( dst.TubeColor, '' ) AS tubeName,
'' AS tubeCode ,
'' as extraParam1,
'' as extraParam2,
'' as extraParam3
FROM
	VocaPatient vp
	INNER JOIN VocaPatientFeeItem vpfi ON vp.ID_Patient = vpfi.ID_Patient
	INNER JOIN DictFeeItem dfi ON dfi.ID_FeeItem = vpfi.ID_FeeItem
	INNER JOIN DictDepart dd ON dd.ID_Depart = vpfi.ID_Depart
	LEFT JOIN DictUser dictOperate ON dictOperate.ID_User = vpfi.ID_Operate
	LEFT JOIN DictSampleType dst ON dfi.ID_SampleType = dst.ID_SampleType -- 使用 XML 方法拆分（兼容旧版本）
	OUTER APPLY ( SELECT VALUE FROM dbo.fn_SplitString_sxzl ( ISNULL( dfi.InterfaceCode3, '' ), ',' ) WHERE dfi.InterfaceCode2 = '1' ) s -- 新增：根据拆分后的 ItemCode 查找对应记录
	LEFT JOIN DictFeeItem dfi_new ON dfi_new.InterfaceCode1 = s.Value 
	AND s.Value IS NOT NULL 
	AND dfi.InterfaceCode2 = '1' 
WHERE
	vp.IS_State < 6 
	AND ( dd.ServiceProviderType IN ( 'LIS' ) OR dfi.InterfaceCode1= '10000193' )