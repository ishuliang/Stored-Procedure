ALTER VIEW wn_lis_getwzxxm AS
SELECT
    -- 以下字段用于查询
    vpfi.barCode as barCode,

    -- 卫宁存储需要的字段
    vp.PatientCode AS PatientID,
    vp.PatientCode AS CureNo,
    vpfi.ID_PatientFeeItem AS LogNo,
    vpfi.applyId AS HisApplyNo,
    vpfi.applyId AS GroupNo,

    -- 只有 code2 = '1' 时才拆分 code3，否则使用原来的 ItemCode
    COALESCE(s.Value, dfi.InterfaceCode1) AS ItemCode,
    COALESCE(dfi_new.FeeItemName, dfi.FeeItemName) AS ItemName,

    vpfi.FactPrice * 1.0 / 100 AS Price,
    '1' AS ItemQty,
    '' AS ItemUnit,
    vpfi.RegisterTime AS ApplyTime,
    vpfi.RegisterTime AS ReceiveTime,
    '' AS CheckTime,
    ISNULL(dictOperate.Number, '') AS ApplyDocCode,
    '632' AS ApplyDept,
    dd.InterfaceCode1 AS ExecDept,
    '0' AS Status,
    '0' AS ItemType,
    '0' AS AddType,
    '1' AS chargeFlag,
    '0' AS Mjzbz,
    ISNULL(dst.SampleCode, '') AS Specimen,
    ISNULL(dst.SampleName, '') AS SpecimenDesc,
    '' AS ItemMemo,
    '' AS fph,
    '' AS ClinicDesc,
    '' AS ghxh,
    '' AS SerialNo,
    '-1' AS ApplyNo,
    ISNULL(dictOperate.Number, '') AS OperatorCode,
    ISNULL(dictOperate.UserName, '') AS OperatorName
FROM VocaPatient vp
INNER JOIN VocaPatientFeeItem vpfi ON vp.ID_Patient = vpfi.ID_Patient
INNER JOIN DictFeeItem dfi ON dfi.ID_FeeItem = vpfi.ID_FeeItem
INNER JOIN DictDepart dd ON dd.ID_Depart = vpfi.ID_Depart
LEFT JOIN DictUser dictOperate ON dictOperate.ID_User = vpfi.ID_Operate
LEFT JOIN DictSampleType dst ON dfi.ID_SampleType = dst.ID_SampleType

-- 使用 XML 方法拆分（兼容旧版本）
OUTER APPLY (
    SELECT Value
    FROM dbo.fn_SplitString_sxzl (ISNULL(dfi.InterfaceCode3, ''), ',')
    WHERE dfi.InterfaceCode2 = '1'
) s

-- 新增：根据拆分后的 ItemCode 查找对应记录
LEFT JOIN DictFeeItem dfi_new
    ON dfi_new.InterfaceCode1 = s.Value
    AND s.Value IS NOT NULL
    AND dfi.InterfaceCode2 = '1'
WHERE vp.IS_State < 6
  AND dd.ServiceProviderType IN ('LIS')
  AND (vpfi.IS_FeeState IN (1,4) OR (vpfi.IS_FeeType = 1 AND ISNULL(vpfi.IS_FeeState,0) <> 2))
  AND ISNULL(vpfi.IS_LisState,'0') IN ('0','1','2')
  AND ISNULL(vpfi.IS_Examine,'0') <> '3'
  AND ISNULL(vpfi.IS_Suspend,'') <> '2'