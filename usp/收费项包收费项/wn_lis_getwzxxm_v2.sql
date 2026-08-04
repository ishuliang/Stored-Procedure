SELECT
    vpfi.barCode AS barCode,
    vp.PatientCode AS PatientID,
    vp.PatientCode AS CureNo,
    vpfi.ID_PatientFeeItem AS LogNo,
    vpfi.applyId AS HisApplyNo,
    vpfi.applyId AS GroupNo,

    COALESCE(s.Value, dfi.InterfaceCode1) AS ItemCode,
    COALESCE(dfi_new.FeeItemName, dfi.FeeItemName) AS ItemName,

    -- 核心逻辑：同一条vpfi源记录拆分出来，组内第1行原价，其余0
    CASE
        WHEN dfi.InterfaceCode2 = '1' AND rn = 1 THEN vpfi.FactPrice * 1.0 / 100
        WHEN dfi.InterfaceCode2 = '1' AND rn > 1 THEN 0.0
        ELSE vpfi.FactPrice * 1.0 / 100
    END AS Price,

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
INNER JOIN VocaPatientFeeItem vpfi
    ON vp.ID_Patient = vpfi.ID_Patient
INNER JOIN DictFeeItem dfi
    ON dfi.ID_FeeItem = vpfi.ID_FeeItem
INNER JOIN DictDepart dd
    ON dd.ID_Depart = vpfi.ID_Depart
LEFT JOIN DictUser dictOperate
    ON dictOperate.ID_User = vpfi.ID_Operate
LEFT JOIN DictSampleType dst
    ON dfi.ID_SampleType = dst.ID_SampleType

OUTER APPLY (
    SELECT Value,
        -- 按原始费用ID分组，拆分后的行编号，同一源行从1开始计数
        ROW_NUMBER() OVER(PARTITION BY vpfi.ID_PatientFeeItem ORDER BY (SELECT NULL)) AS rn
    FROM dbo.fn_SplitString_sxzl (ISNULL(dfi.InterfaceCode3, ''), ',')
    WHERE dfi.InterfaceCode2 = '1'

    -- InterfaceCode2 !=1 补一行null，保证不拆分的数据正常输出
    UNION ALL
    SELECT NULL AS Value, 1 AS rn WHERE dfi.InterfaceCode2 <> '1'
) s

LEFT JOIN DictFeeItem dfi_new
    ON dfi_new.InterfaceCode1 = s.Value
    AND s.Value IS NOT NULL
    AND dfi.InterfaceCode2 = '1'

WHERE vp.IS_State < 6
  AND (dd.ServiceProviderType IN ('LIS') OR dfi.InterfaceCode1 = '10000193')
  AND (vpfi.IS_FeeState IN (1,4) OR (vpfi.IS_FeeType = 1 AND ISNULL(vpfi.IS_FeeState,0) <> 2))
  AND ISNULL(vpfi.IS_LisState,'0') IN ('0','1','2')
  AND ISNULL(vpfi.IS_Examine,'0') <> '3'
  AND ISNULL(vpfi.IS_Suspend,'') <> '2'