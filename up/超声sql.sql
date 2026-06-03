SELECT
                vp.PatientCode                                          AS PatientID,
                vp.PatientCode                                          AS CureNo,
                vpfi.ID_PatientFeeItem                                  AS LogNo,
                vpfi.applyId                                            AS HisApplyNo,
                vpfi.applyId                                                    AS GroupNo,
                dfi.InterfaceCode1                                      AS ItemCode,
                dfi.FeeItemName                                         AS ItemName,
                vpfi.FactPrice * 1.0 / 100                              AS Price,
                '1'                                                   AS ItemQty,
                ''                                                    AS ItemUnit,
                vpfi.RegisterTime                                       AS ApplyTime,
                vpfi.RegisterTime                                       AS ReceiveTime,
                ''                                                    AS CheckTime,
                ISNULL(dictOperate.Number, '')                        AS ApplyDocCode,
                '632'                                                    AS ApplyDept,
                dd.InterfaceCode1                                       AS ExecDept,
                '0'                                                   AS Status,
                '1'                                                    AS ItemType,
                '0'                                                   AS AddType,
                '1'                                                   AS chargeFlag,
                '0'                                                   AS Mjzbz,
                ISNULL(dst.SampleCode, '')                            AS Specimen,
                ISNULL(dst.SampleName, '')                            AS SpecimenDesc,
                ''                                                    AS ItemMemo,
                ''                                                    AS fph,
                ''                                                    AS ClinicDesc,
                ''                                                    AS ghxh,
                ''                                                    AS SerialNo,
                '-1'                                                  AS ApplyNo,
                ISNULL(dictOperate.Number, '')                        AS OperatorCode,
                ISNULL(dictOperate.UserName, '')                      AS OperatorName,
                ''腹部''                                                    AS BW,
                dfi.FeeItemName                                                    AS JCXM
            FROM VocaPatient vp
            INNER JOIN VocaPatientFeeItem vpfi      ON vp.ID_Patient = vpfi.ID_Patient
            INNER JOIN DictFeeItem dfi              ON dfi.ID_FeeItem = vpfi.ID_FeeItem
            INNER JOIN DictDepart dd                ON dd.ID_Depart = vpfi.ID_Depart
            LEFT  JOIN DictUser dictOperate         ON dictOperate.ID_User = vpfi.ID_Operate
            LEFT  JOIN DictSampleType dst           ON dfi.ID_SampleType = dst.ID_SampleType


            WHERE vp.IS_State < 6
          AND dd.ServiceProviderType in ('WN')
          AND (vpfi.IS_FeeState IN (1,4) OR (vpfi.IS_FeeType = 1 AND ISNULL(vpfi.IS_FeeState,0) <> 2))
          AND ISNULL(vpfi.IS_LisState,'0') IN ('0','1')
          AND ISNULL(vpfi.IS_Examine,'0') <> '3'
          AND ISNULL(vpfi.IS_Suspend,'') <> '2'