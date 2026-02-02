# 业务表（voca）

**注意：体软所有日期格式均为：yyyy-MM-dd hh:mm:ss ，接口插入时请注意**[业务表（voca）](https://znpl49mgza.feishu.cn/wiki/wikcngmsRELGJlyr6qImAV01z5g?table=tblHhYLPgFZ6uHiF&view=vewRuQ1ahU) 

**VocaPatient 业务人员表** dictsampletype

| **VocaPatient 业务人员表** |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_Patient | int | 4 |  | 0 | 人员表主键 | √ |
| PatientName | varchar | 50 | √ | 0 | 体检者名称 |  |
| PatientCode | varchar | 50 | √ | 0 | 体检流水号，由P\_GetPatientCode产生 |  |
| BriefCode | varchar | 50 | √ | 0 | 输入码调用标量函数F\_getBriefCode获取，推荐提交时动态获取 |  |
| Sex | varchar | 5 | √ | 0 | 性别 0或者null为未录 1男2女3未知(在业务处理里比如vp或rp表3表示未知，<br>输入码，软件支持在任何地方支持首字母快捷录入功能，<br>在字典业务表里比如ds，dfi等表3表示为男女均可) |  |
| Age | int | 4 | √ | 0 | 年龄 |  |
| Marriage | varchar | 5 | √ | 0 | 0或者null为未录，1未婚 2已婚3未知(在业务处理里比如vp或rp表3表示未知，<br>在字典业务表里比如ds，dfi等表3表示为收费项不关心婚姻) |  |
| Phone | varchar | 20 | √ | 0 | 电话 |  |
| IdentityCard | varchar | 20 | √ | 0 | 身份证 |  |
| Birthday | varchar | 20 | √ | 0 | 生日 |  |
| Address | varchar | 500 | √ | 0 | 住址 |  |
| ID\_ResePatient | int | 4 | √ | 0 | 预约人员id，关联ResePatient表 |  |
| ID\_Org | int | 4 | √ | 0 | 单位id |  |
| OrgName | varchar | 50 | √ | 0 | 单位名称 |  |
| ID\_Task | int | 4 | √ | 0 | 任务id |  |
| TaskName | varchar | 50 | √ | 0 | 任务名称 |  |
| ID\_Group | int | 4 | √ | 0 | 分组id |  |
| GroupName | varchar | 50 | √ | 0 | 分组名称 |  |
| ID\_Suit | int | 4 | √ | 0 | 字典套餐表主键 |  |
| SuitName | varchar | 50 | √ | 0 | 套餐名称 |  |
| IS\_State | varchar | 5 | √ | 0 | 0或者null：本地新加数据。<br> 1：预约数据<br> 2：已登记<br> 3：已开检<br> 4：已检完<br> 5：开始总检<br> 6：已总检<br> 7：开始终审<br> 8：已终审<br> 9：已领取报告 |  |
| ID\_ExamType | int | 4 | √ | 0 | 体检类型 |  |
| ExamTypeName | varchar | 50 | √ | 0 | 体检类型名称 | 东阳版本有 |
| ID\_PatientLevel | int | 4 | √ | 0 | 客户级别 |  |
| Pic | image | 16 | √ | 0 | 图片，强烈建议读取身份证的图片。 |  |
| ID\_Register | int | 4 | √ | 0 | 登记员id |  |
| RegisterName | varchar | 50 | √ | 0 | 登记员名称 |  |
| RegisterTime | varchar | 50 | √ | 0 | 登记时间 |  |
| ID\_FinalExam | int | 4 | √ | 0 | 总检人 |  |
| FinalExamName | varchar | 50 | √ | 0 | 总检人名称 |  |
| FinalExamTime | varchar | 50 | √ | 0 | 总检时间 |  |
| ID\_FinalJudgment | int | 4 | √ | 0 | 终审人员id |  |
| FinalJudgmentName | varchar | 50 | √ | 0 | 终审人员姓名 |  |
| FinalJudgmentTime | varchar | 50 | √ | 0 | 终审人员时间 |  |
| ID\_Report | int | 4 | √ | 0 | 报告打印人 |  |
| ReportName | varchar | 50 | √ | 0 | 报告打印人名称 |  |
| ReportTime | varchar | 50 | √ | 0 | 报告打印时间 |  |
| StartExamTime | varchar | 50 | √ | 0 | 开始体检时间 格式为 2020-04-15 14:12:00，<br>分科任何一项有检查结果，或采样时间。 |  |
| StartFinalExamTime | varchar | 50 | √ | 0 | 开始总检时间 格式为 2020-04-15 14:12:00 |  |
| ID\_OrgSheet | int | 4 | √ | 0 | 团体结算单主键 |  |
| IS\_Recovery | varchar | 5 | √ | 0 | 是否收单 0/null:未收单 1:已收单 |  |
| ID\_Recovery | int | 4 | √ | 0 | 收单人ID |  |
| RecoveryName | varchar | 50 | √ | 0 | 收单人名称 |  |
| RecoveryTime | varchar | 50 | √ | 0 | 收单时间 |  |
| Overview | varchar | 8000 | √ | 0 |  |  |
| ID\_Overview | int | 4 | √ | 0 |  |  |
| OverviewName | varchar | 50 | √ | 0 |  |  |
| OverviewTime | varchar | 50 | √ | 0 |  |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 50 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | CardType0 | 备注 |  |
| IS\_Settlement | varchar | 5 | √ | 0 | 结算状态:<br>0/null 正常数据，1 参与结账，进团体报告，2 参与结账，不进团体报告，<br>3不参与结账 |  |
| SettlementContent | varchar | 500 | √ | 0 | 结算备注 |  |
| DetailAddress | varchar | 500 | √ | 0 |  |  |
| PatientConclusion | varchar | 500 | √ | 0 |  |  |
| DepartMent | varchar | 50 | √ | 0 | 部门 |  |
| EmployeeNumber | varchar | 50 | √ | 0 | 员工编号 |  |
| ExamTypeCode | varchar | 50 | √ | 0 | 体检类型编码，除老医院，其余采用VocaPatientExtend表的PhysicalTypes |  |
| ExcelOrder | int | 4 | √ | 0 | excel排序 |  |
| CreateTime | varchar | 50 | √ | 0 | 创建时间 |  |
| ID\_Examined | int | 4 | √ | 0 | 审核人ID |  |
| ExaminedName | varchar | 50 | √ | 0 | 审核人名字 |  |
| ExaminedTime | varchar | 50 | √ | 0 | 审核时间 |  |
| IS\_Assign | int |  |  |  | 总检分配 |  |
| ReservedTime | varchar |  |  |  | 预约体检日期 格式yyyy-MM-dd hh:mm:ss |  |
| Source | int |  |  |  | 来源 ：<br>0/null 体软<br>1 自助机<br>2 平台 |  |
| JudgeRejectCount | int |  |  |  | 审核拒绝次数 |  |
| JudgeOperation | varchar |  |  |  | 审核操作 A 通过 R拒绝 |  |
| CardType | varchar | 100 |  |  | 证件类型:<br>1身份证、2台胞证、3军官证、4港澳通行证 5护照 |  |
| Deleted | int |  |  |  | 0正常 1已删除 2 被替检 |  |
| AmountCard | numeric | 18 |  | 2 | 金额卡金额(除东阳外，没用处) | 东阳特有 |
| AarchivesCode | varchar |  |  |  | 档案号，关联档案表Code |  |
| PatientRelative | int |  |  |  | 关联体检人id，替检/代检人才有。B替检A,则B这个字段填A的id\_Patient |  |
| PatientNameRelative | varchar |  |  |  | 关联体检人名，替检人才有 |  |
| Referee | varchar | 50 |  |  | 推荐人 |  |
| RefereeRelation | varchar | 50 |  |  | 推荐关系 |  |
| ClinicalTrials | int |  |  |  | 临床试验？ |  |
| IS\_Suspend | int |  |  |  | 是否挂起<br>0 未挂起，默认值 1挂起但当前已正常 2 挂起 |  |
| HIS\_PatientID | varchar |  |  |  | his门诊编号 | 并非所有医院都有，接口添加 |
| isBreast | int | 4 |  |  | 名下是否有乳腺科收费项 0/null 否 1是 | 江西妇幼独有 |
| ReportMedium | int | 4 | √ |  | _报告意向： 1 纸质报告 2 电子报告 3 邮寄报告_ |  |
| IsReset | int | 4 | √ |  | _是否重置字段，0表示未重置，1表示已重置_ |  |
| DepartPrintStatus | int | 4 | √ |  | _是否科室打印过 0 否 1是_ |  |
| PreFinalExam | int | 4 | √ |  | 预总检-0/null 未初审<br>1 已初审 |  |
| ID\_PreFinalExam | int | 4 | √ |  | 预总检-<br>初审医生id |  |
| PreFinalExamName | varchar | 50 | √ |  | 预总检-初审医生名称 |  |
| PreFinalExamTime | varchar | 50 | √ |  | 预总检-初审时间 |  |
| TaskNote | varchar | 2000 | √ |  | 团体备注 |  |
| TsNote | varchar | 2000 | √ |  | 任务备注 |  |
| NativePlace | varchar | 512 | √ |  | 籍贯 |  |
| CompanyName | varchar | 512 | √ |  | 工作单位 |  |
| PostAddress | varchar | 500 | √ |  | 邮寄地址 |  |
| recovortytime |  |  |  |  | 收单时间 |  |
| OcdFirstAsk | varchar | 10 |  |  | 标记职业病是否症状询问：<br>0：未询问<br>1：已询问 |  |

**VocaPatientExtend 业务人员拓展表**

| **VocaPatientExtend 业务人员拓展表** |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 默认值 | 说明 | 是否主键 |
| ID\_PatientExtend | int | NULL | NO | NULL |  | 是 |
| ID\_Patient | int | NULL | YES | NULL | 体检人id |  |
| OcdFactorId | varchar | 500 | YES | NULL | 危害因素id， 英文逗号拼合 |  |
| OcdFactorName | varchar | 2000 | YES | NULL | 危害因素名称， 英文逗号拼合 |  |
| OcdFactorType | varchar | 50 | YES | NULL | 危害因素类别集合， 英文逗号拼合 |  |
| PositionStatus | varchar | 50 | YES | NULL | 岗位状态 |  |
| RegisteredType | varchar | 50 | YES | NULL | 户口类型 |  |
| OccupationType | varchar | 50 | YES | NULL | 职业类型 |  |
| MarriageType | varchar | 50 | YES | NULL | 婚姻性质 |  |
| RegisteredAddress | varchar | 200 | YES | NULL | 户口省市区 |  |
| RegisteredAddressDetail | varchar | 500 | YES | NULL | 户口省明细地址 |  |
| Postcode | varchar | 50 | YES | NULL | 邮编 |  |
| MarriageCheckYear | varchar | 50 | YES | NULL | 婚姻年号 |  |
| MarriageCheckCode | varchar | 50 | YES | NULL | 婚检号 |  |
| PatientSign | image | 2.15E+09 | YES | NULL | 体检人签名 |  |
| MarriageOpinion | varchar | 200 | YES | NULL | 婚检建议 |  |
| ID\_Operate | int | NULL | YES | NULL |  |  |
| OperateName | varchar | 50 | YES | NULL |  |  |
| OperateTime | varchar | 50 | YES | NULL |  |  |
| PhysicalTypes | varchar | 50 | YES | NULL | 体检类型 |  |
| MarriageOpinionType | varchar | 50 | YES | NULL | 婚检建议类型 |  |
| LifeHistory | varchar | 500 | YES | NULL | 生活史 |  |
| PastMedicalHistory | varchar | 500 | YES | NULL | 用药史 |  |
| FamilyHistory | varchar | 500 | YES | NULL | 家族史 |  |
| PhysicalTypeName | varchar | 100 | YES | NULL | 体检类型名称，对应PhysicalTypes |  |
| Opinion | varchar | 500 | YES | NULL | 体检建议 |  |
| Nation | varchar | 50 | YES | NULL | 民族 |  |
| EducationLevel | varchar | 50 | YES | NULL | 文化程度 |  |
| PrintTime | varchar | 50 | YES | NULL | 指引单打印时间？ |  |
| VisitRegistration | varchar | 5 | YES | ((0)) | 就诊登记状态（0或null未发送，1为已回传）--用于北京中西医测试 |  |
| VisitRegistrationNumber | int | NULL | YES | NULL | 就诊登记号---用于北京中西医测试 |  |
| ScopeOfEngagement | varchar | 50 | YES | NULL | 从事范围 |  |
| EnterpriseName | varchar | 50 | YES | NULL | 企业名称 |  |
| Profession | varchar | 50 | YES | NULL | 工种 |  |
| OtherProfession | varchar | 50 | YES | NULL | 其他工种名称 |  |
| RadiateProfession | varchar | 50 | YES | NULL | 放射工种 |  |
| StartFactorDate | varchar | 50 | YES | NULL | 开始接害日期 |  |
| SeniorityYear | varchar | 50 | YES | NULL | 总工龄（年） |  |
| SeniorityMonth | varchar | 50 | YES | NULL | 总工龄（月） |  |
| FactorYear | varchar | 50 | YES | NULL | 接害工龄（年） |  |
| FactorMonth | varchar | 50 | YES | NULL | 接害工龄（月） |  |
| Company | varchar | 4 | YES | NULL | 用工单位 |  |
| ReExamIdPatient | int | NULL | YES | NULL | 复检 原id |  |
| ReExamState | int | NULL | YES | NULL |  |  |
| ReportStatus | varchar | 5 | YES | ((0)) | 报告状态 0待打印 1已打印 2 已打印待领取 3 未打印已领取 4 已打印已领取 |  |
| Relation | varchar | 20 | YES | NULL | 家属信息 |  |
| RelationPhone | varchar | 20 | YES | NULL | 家属电话 |  |
| ExamTimes | int | NULL | YES | NULL |  |  |
| LatestExamTime | varchar | 20 | YES | NULL |  |  |
| depart | varchar | 800 | YES | NULL | 部门 |  |
| protectiveMeasure | varchar | 800 | YES | NULL | 防护措施 |  |
| Signed | int | NULL | YES | NULL | 是1否0已报到 |  |
| SignedTime | varchar | 20 | YES | NULL | 报到时间 |  |
| OcdProtectMeasure | varchar | 2000 | YES | NULL | 防护措施 |  |
| OcdMonitoringType | varchar | 100 | YES | NULL | 监测类型 |  |
| MaritalDate | varchar | 255 | YES | NULL | 职业检问询-结婚日期 |  |
| MaritalStatus | varchar | 255 | YES | NULL | 职业检问询-结婚状态 |  |
| OtherSymptom | varchar | 255 | YES | NULL | 其他症状 |  |
| MaritalSpousesRadiationExposure | varchar | 255 | YES | NULL | 配偶接受放射线照射情况 |  |
| MaritalSpouseOccupationAndStatus | varchar | 255 | YES | NULL | 配偶职业及健康状况 |  |
| SmokingSitu | varchar | 255 | YES | NULL | 吸烟情况 |  |
| SomokingFreq | int | NULL | YES | NULL | 吸烟频率：包/天 |  |
| SmokingYears | varchar | 255 | YES | NULL | 抽烟年限 |  |
| DrinkingSitu | varchar | 255 | YES | NULL | 饮酒情况 |  |
| DrinkingFreq | int | NULL | YES | NULL | 饮酒频率：ml/天 |  |
| DrinkingYears | varchar | 255 | YES | NULL | 饮酒年限 |  |
| MenarcheAge | int | NULL | YES | NULL | 初潮年龄 |  |
| MenstrualPeriod | varchar | 255 | YES | NULL | 经期 |  |
| MenstrualFreq | int | NULL | YES | NULL | 周期（天） |  |
| MenopauseAge | int | NULL | YES | NULL | 停经年龄 |  |
| IsMenstrualPeriod | bit | NULL | YES | NULL | 是否经期 |  |
| Exception | varchar | 255 | YES | NULL | 异常,1异常 0非异常 |  |
| OffSprings | int | NULL | YES | NULL | 子女人数 |  |
| PrematureBirthFreq | int | NULL | YES | NULL | 早产次数 |  |
| AbortionFreq | int | NULL | YES | NULL | 流产次数 |  |
| StillBirthFreq | int | NULL | YES | NULL | 死产次数 |  |
| TeratomaFreq | int | NULL | YES | NULL | 畸胎次数 |  |
| ChildrenHeal | varchar | 500 | YES | NULL | 子女健康 |  |
| OthersAboutBirth | varchar | 500 | YES | NULL | 生育相关的其他信息 |  |
| RadiationTypeCode | varchar | 50 | YES | NULL | 放射种类编码 |  |
| DoseTestOrg | varchar | 50 | YES | NULL | 剂量检测单位 |  |
| KnowledgeTrainingOrg | varchar | 50 | YES | NULL | 知识培训单位 |  |
| MainFactorYear | int | NULL | YES | NULL | 重点职业病危害工龄（年） |  |
| MainFactorMonth | int | NULL | YES | NULL | 重点职业病危害工龄（月） |  |
| IS\_SinglePage | int | NULL | YES | NULL | 报告是否领取单页，0-整页，1-单页 |  |
| HealthProfession | varchar | 50 | YES | NULL | 工种类型？？ | 附属南华、孟州民生独有 |
| PoliceTwo | varchar | 50 | YES | NULL | 办案警员2 | 附属南华、孟州民生独有 |
| PoliceTwoNumber | varchar | 50 | YES | NULL | 警员2编号 | 附属南华、孟州民生独有 |
| PoliceOne | varchar | 50 | YES | NULL | 办案警员1 | 附属南华、孟州民生独有 |
| PoliceOneNumber | varchar | 50 | YES | NULL | 警员1编号 | 附属南华、孟州民生独有 |

| **VocaPatientConsumeItem 体检人物价表-****无论是否使用物价，都有，没有物价的时候使用默认的。修改价格一定要同步修改vpfi,vpci的** |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 默认值 | 说明 | 是否主键 |
| ID\_PatientConsumeItem | int | 4 | 0 | NULL |  | 是 |
| ID\_Patient | int | 4 | 1 | NULL | 体检人id，关联vp |  |
| ID\_PatientFeeItem | int | 4 | 1 | NULL | 用户收费项id，关联vpfi |  |
| ID\_ConsumeItem | int | 4 | 1 | NULL | 物价id，关联物价字典表DictConsumeItem |  |
| ConsumeItemName | varchar | 500 | 1 | NULL | 物价名称 |  |
| ConsumeItemCode | varchar | 100 | 1 | NULL | 物价编码 |  |
| FeeItemInterfaceCode | varchar | 100 | 1 | NULL | 收费项编码 |  |
| Quantity | float | 8 | 1 | NULL | 数量 |  |
| Price | numeric | 9 | 1 | NULL | 单价 |  |
| Discount | float | 8 | 1 | 1 | 折扣，默认1。但实际使用百分制，比如7折，会填入70 |  |
| FactPrice | numeric | 9 | 1 | NULL | 折后单价 |  |
| IS\_FeeState | varchar | 5 | 1 | NULL | 默认0，0/null:未收 1:已收 2:拟退 4 部分收费（个付部分已支付），同VPFI的IS\_FeeState字段 |  |
| IS\_FeeType | varchar | 5 | 1 | NULL | 同vpfi,<br> 0/null:新加项,个人结算 1:团体统收项 |  |
| ID\_FeeItem | int | 4 | 1 | NULL | 收费项id，对应dictfeeItem表 |  |
| IS\_HIS | varchar | 50 | 1 | NULL | 0或null为未发送，1为发送，2为退费 |  |
| HisCode | varchar | 500 | 1 | NULL | 接口添加，具体定义未知？ |  |
| PersonPrice | numeric | 9 | 1 | 0 | 个人付费金额(物价中个人付部分，不一定有用，具体看医院版本) |  |
| GroupPrice | numeric | 9 | 1 | 0 | 单位付费金额(物价中单位付部分，不一定有用，具体看医院版本) |  |
|  |  |  |  |  |  |  |

**VocaPatientCareerHistory 职业史**

| **VocaPatientCareerHistory 职业史** |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_PatientCareer | int | 4 |  | 0 |  | √ |
| IdentityCard | varchar | 20 | √ | 0 | 身份证号 |  |
| PatientName | varchar | 50 | √ | 0 | 病人名称 |  |
| StartDate | varchar | 50 | √ | 0 | 开始时间 |  |
| EndDate | varchar | 50 | √ | 0 | 结束时间 |  |
| FactorId | varchar | 150 | √ | 0 | 因素ID |  |
| FactorName | varchar | 500 | √ | 0 | 因素名称 |  |
| Company | varchar | 50 | √ | 0 | 公司名称 |  |
| OccupationType | varchar | 50 | √ | 0 | 工种 |  |
| WorkingAge | varchar | 50 | √ | 0 | 工龄 |  |
| ContactTime | varchar | 50 | √ | 0 | 接触时间 |  |
| ProtectiveMeasures | varchar | 200 | √ | 0 | 防护措施 |  |
| ID\_Operate | int | 4 | √ | 0 | 打印人id |  |
| OperateName | varchar | 50 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| ID\_Patient | int | 4 | √ | 0 |  |  |

**VocaPatientCard 体检人限额表**

| VocaPatientCard 体检人限额表（额度字段单位都是分，vpc不为空表示为用限额） |  |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 默认值 | 精确位 | 说明 | 是否主键 |
| ID\_PatientCard | int | 4 |  |  | 0 | 业务结论表主键 | √ |
| ID\_Patient | int | 4 |  |  | 0 | 人员表id |  |
| AmountCard | numeric | 18 |  |  | 2 | 可用总限额， 单位分  = InitAmountCard-TransferAmounrCard+ SupplementAmount |  |
| RemainAmountCard | numeric | 18 |  | 0 | 2 | 剩余可用额度， AmountCard-已用额度 |  |
| Type | int | 4 |  | 0 |  | 0 限额 |  |
| PreAmountCard | numeric | 18 |  | 0 |  | 插入时，等于InitAmountCard，目前没有实际用处 |  |
| CardUsedTimes | int | 4 |  | 0 |  | 限额使用次数 0 仅本次 1无限制（在系统配置开启但是情况下，总检后，限额剩余会自动转入同证件电子卡中） |  |
| InitAmountCard | numeric | 18 |  | 0 |  | 初始额度 |  |
| TransferAmounrCard | numeric | 18 |  | 0 |  | 转赠额度，正数 |  |
| CanTransfer | int | 4 |  | 0 |  | 是否可以转赠 1允许，0不允许 |  |
| SupplementAmount | numeric | 18 |  | 0 |  | 补充额度（提额额度），正数 | 孟州民生实现 |
| ActualSupplementAmount | numeric | 18 |  | 0 |  | 实际使用的补充额度 | 孟州民生实现 |
| AdditionInvisible | int | 4 |  | 0 |  | 加项是否不可见 0 可见 1不可见。 （就是加项了，所有报表也不计算这部分加项金额） | 孟州民生实现 |

**Voca****QuotaTransfer** **体检人转赠到电子卡记录表**

| VocaQuotaTransfer 体检人转赠到电子卡记录表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 默认值 | 说明 | 是否主键 |
| ID\_QuotaTransfer | int | NULL | NO | NULL |  | 是 |
| ID\_Patient | int | NULL | YES | NULL | 转赠人：体检人id |  |
| PatientName | varchar | 50 | YES | NULL | 转赠人：体检人名 |  |
| PatientCode | varchar | 20 | YES | NULL | 转赠人：体检编号 |  |
| Sex | varchar | 5 | YES | NULL | 转赠人：性别，1男 2女 3 未知 同vp |  |
| Age | int | NULL | YES | NULL | 转赠人：年龄 |  |
| IdentityCard | varchar | 20 | YES | NULL | 转赠人：证件号 |  |
| Phone | varchar | 20 | YES | NULL | 转赠人：电话号码 |  |
| ID\_Org | int | NULL | YES | NULL | 转赠人：单位id |  |
| OrgName | varchar | 200 | YES | NULL | 转赠人：单位名称 |  |
| ID\_Task | int | NULL | YES | NULL | 转赠人：任务id |  |
| TaskName | varchar | 200 | YES | NULL | 转赠人：任务名称 |  |
| ContactsName | varchar | 50 | YES | NULL | 转赠人：联系名称 |  |
| ContactsPhone | varchar | 20 | YES | NULL | 转赠人：联系电话 |  |
| CardUsedTimes | int | NULL | YES | NULL | 转赠人：vpcard是否限制使用次数<br>_0限制 1无限制_ |  |
| TransferType | int | NULL | YES | ((1)) | 转赠人：<br>_1 团检限额 2体检项目_ |  |
| QuotaAmountBeforeTransfer | numeric | NULL | YES | NULL | 转赠人：<br>_转赠前额度，单位分_ |  |
| AmountTransferred | numeric | NULL | YES | NULL | 转赠人：<br>_转赠额度，单位分_ |  |
| ToIdentityCard | varchar | 20 | YES | NULL | 接收人：证件号 |  |
| ToEIdCard | int | NULL | YES | NULL | 接收人：电子卡id |  |
| ToPatientName | varchar | 50 | YES | NULL | 接收人：姓名 |  |
| ToSex | varchar | 5 | YES | NULL | 接收人：性别 |  |
| ToPhone | varchar | 20 | YES | NULL | 接收人：手机号 |  |
| ToECardNo | varchar | 20 | YES | NULL | 接收人：电子卡号 |  |
| ToECardType | varchar | 5 | YES | NULL | 接收人：电子卡类型 1 存储卡 1一次性消费卡 |  |
| ToECardAmountBeforeTransfer | numeric | NULL | YES | NULL | 接收人：<br>_转赠额度后卡金额，单位分_ |  |
| ToECardAmountAfterTransfer | numeric | NULL | YES | NULL | 接收人：<br>_转赠额度后卡金额，单位分_ |  |
| Relation | varchar | 500 | YES | NULL | 两者关系 |  |
| Note | varchar | 500 | YES | NULL | 转赠备注 |  |
| ID\_Operate | int | NULL | YES | NULL | 操作人id |  |
| OperateName | varchar | 50 | YES | NULL | 操作人名称 |  |
| OperateTime | varchar | 20 | YES | NULL | 操作时间 |  |
| ID\_Group | int | NULL | YES | NULL | 转赠人：分组id |  |
| GroupName | varchar | 200 | YES | NULL | 转赠人：分组名称 |  |

**VocaPatientConclusion 业务结论表**

| VocaPatientConclusion 业务结论表 |  |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 |  | 精确位 | 说明 | 是否主键 |
|  |  |  |  |  |  |  |  |
| ID\_PatientConclusion | int | 4 |  |  | 0 | 业务结论表主键 | √ |
| ID\_Patient | int | 4 | √ |  | 0 | 人员表id |  |
| ID\_Depart | int | 4 | √ |  | 0 | 科室id |  |
| ID\_Conclusion | int | 4 | √ |  | 0 | 结论id |  |
| ID\_PatientExamItem | int | 4 | √ |  | 0 | 体检者体检项目主键ID |  |
| ID\_PatientExamItemSign | int | 4 | √ |  | 0 | 体检人员体征词流水主键ID |  |
| Conclusion\_Name | varchar | 200 | √ |  | 0 | 结论名称（冗余字段，方便查询） |  |
| IS\_State | varchar | 5 | √ |  | 0 | 是否显示 0不显示 1显示 ，默认为显示，总检设计 |  |
| IS\_Merge | int | 4 |  |  |  | 0=未合并<br>1=已合并 <br>2=被合并  <br>3=之前被合并后面拆分了 <br>5=重复结论 |  |
| ID\_ConclusionMerge | int | 4 | √ |  | 0 | 合并后的结论词ID |  |
| Suggest | varchar | 8000 | √ |  | 0 | 结论词建议 |  |
| ID\_SevereLevel | int | 4 | √ |  | 0 | 重症级别 |  |
| ID\_Operate | int | 4 | √ |  | 0 | 操作人id |  |
| OperateName | varchar | 50 | √ |  | 0 | 操作人 |  |
| OperateTime | varchar | 50 | √ |  | 0 | 操作时间 |  |
| Note | varchar | 500 | √ |  | 0 | 备注 |  |
| DisplayOrder | varchar | 10 | √ |  | 0 | 排序序号，为了支持中途添加，暂设定为字符串类型，注意：会出现9>10的情况 |  |
| AddType | int |  |  |  |  | Null 初始化<br>0 自动生成<br>1 手动添加<br>3 诊断引擎<br>4 智能算法 |  |
| ID\_ParientConclusion\_Merge | int |  |  |  |  | 被合并后，合并新生成的合并结论id，用于关联 |  |
| Deleted | int |  |  |  | 0 | 1 已删除 0未删除 。（后续废弃，但注意由此引发的问题） |  |
| ManualSplit | int |  |  |  |  | 手动拆分结论 1 已手动拆分 0 非手动拆分 |  |
| SmartSplit | int |  |  |  |  | 智能拆分结论 1 已智能拆分 0 非手动拆分 |  |
| TrySmartSplited | int |  |  |  |  | 尝试过智能拆分 1 尝试过 0 未尝试过。（拆分是定时的，用于标记） | 东阳独有，但在通用 实际没用，需配合朱敬华诊断分割功能程序 |
| CanSmartSplit | int |  |  |  |  | 是否可进行智能拆分<br>1 可以 0 不可以 |  |
| ID\_Conclusion\_Formula | int |  |  |  |  | 结论来源诊断公式 |  |
| ID\_Depart\_Show | int |  |  |  |  | 结论来源科室，id\_Depart不准，所以用这个 |  |
| IdRule | int |  |  |  |  | 诊断引擎：来源于哪个诊断规则id |  |
| Basis | varchar | 255 |  |  |  | _诊断理由_ |  |
| SummaryGeneration | int |  |  |  |  | _是否是标准小结直接生成结论 0或null=不是 1=是_ |  |
| RuleResultType | int |  |  |  |  | _1: 诊断疾病  2:疑似疾病 3:异常问题_ |  |
| BodyPart | varchar | 8 |  |  |  | _部位id_ |  |

**VocaPatientDiagnosticResult****诊断结果**

| **VocaPatientDiagnosticResult****诊断结果** |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 默认值 | 说明 | 是否主键 |
| ID\_DiagnosticResult | int | 4 | 0 | NULL |  | 是 |
| ID\_Patient | int | 4 | 1 | NULL | 体检人id |  |
| ID\_Depart | int | 4 | 1 | NULL | 对应科室id |  |
| ID\_Conclusion\_Formula | int | 4 | 1 | NULL | 诊断公式id |  |
| FormulaName | varchar | 200 | 1 | NULL | 结论名称 |  |
| ID\_PatientExamItem | int | 4 | 1 | NULL | 体检人检查项id |  |
| ID\_PatientConclusion | int | 4 | 1 | NULL | 对应体检人结论id |  |
|  |  |  |  |  |  |  |

**VocaPatientDepart 业务科室表**

| VocaPatientDepart 业务科室表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_PatientDepart | int | 4 |  | 0 | 业务科室表id | √ |
| ID\_Patient | int | 4 | √ | 0 | 人员表主键 |  |
| ID\_Depart | int | 4 | √ | 0 | 字典科室表主键 |  |
| DepartName | varchar | 50 | √ | 0 | 科室名称 |  |
| IS\_State | varchar | 5 | √ | 0 | 0或者null新生产数据，1为小结2为审核 |  |
| Summary | varchar | 500 | √ | 0 | 小结内容 |  |
| ID\_Summary | int | 4 | √ | 0 | 小结人id |  |
| SummaryName | varchar | 50 | √ | 0 | 小结人姓名 |  |
| SummaryTime | varchar | 50 | √ | 0 | 小结时间 |  |
| ID\_Audit | int | 4 | √ | 0 | 审核人id |  |
| AuditName | varchar | 50 | √ | 0 | 审核人姓名 |  |
| AuditTime | varchar | 50 | √ | 0 | 审核时间 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 50 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |
| ID\_Print | int | NULL | YES | (NULL) | 打印人id |  |
| PrintName | varchar | 50 | YES | (NULL) | 打印人名称 |  |
| PrintTime | varchar | 20 | YES | (NULL) | 打印时间 |  |
| Rejected | varchar | 5 | YES | ((0)) | 是否被拒审 0 否 1 是 |  |
| RejectedMsg | varchar | 4000 | YES | ((0)) | 拒审理由 |  |
| AnnotationTime | varchar | 50 | YES | NULL | 标注时间 |  |
| StandardizeStatus | bit | NULL | NO | ((1)) | 标准化状态 1：未标准化 2：部分标准化 3：已标准化 |  |
| StandardData | varchar | 8000 | YES | NULL | 标准数据 |  |
| Annotator | int | NULL | YES | NULL | 标注人 |  |

**VocaPatientLatestInfo 体检人最新科室小结、审核信息 类个人**

| VocaPatientLatestInfo 体检人最新科室小结、审核信息，用于分科-全部科室 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_Patient | int | NULL | NO | NULL | 体检人id | 是 |
| SummaryName | varchar | 50 | YES | NULL | 体检人最新一个科室：小结人 |  |
| SummaryTime | varchar | 50 | YES | NULL | 体检人最新一个科室：小结时间 |  |
| AuditName | varchar | 50 | YES | NULL | 体检人最新一个科室：审核人 |  |
| AuditTime | varchar | 50 | YES | NULL | 体检人最新一个科室：审核时间 |  |
| IS\_State | varchar | 5 | YES | ((0)) | 体检人最新科室状态（排除外检）：<br>2 所有科室都审核<br>1 所有科室都小结<br>0 有科室未小结未审核 |  |
| Rejected | varchar | 5 | YES | ((0)) | 是否被拒审 0 否 1 是 |  |
| RejectedMsg | varchar | 4000 | YES | ((0)) | 拒审理由 |  |
|  |  |  |  |  |  |  |

**VocaPatientExamItem 业务检查项表**

| VocaPatientExamItem 业务检查项表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_PatientExamItem | int | 4 |  | 0 | 业务检查项表主键 | √ |
| ID\_Patient | int | 4 | √ | 0 | 人员表主键 |  |
| ID\_Depart | int | 4 | √ | 0 | 字典科室表主键 |  |
| ID\_PatientFeeItem | int | 4 | √ | 0 | 业务收费项表主键 |  |
| ID\_ExamItem | int | 4 | √ | 0 | 字典检查项表主键 |  |
| ExamItemName | varchar | 200 | √ | 0 | 检查项名称 |  |
| InterfaceCode1 | varchar | 50 | √ | 0 | 默认是0或者null，可回写lis编码，方便检测。 |  |
| ExamItemValue | varchar | 500 | √ | 0 | 检测结果 |  |
| ID\_SevereLevel | int | 4 | √ | 0 | 重症级别表主键 |  |
| RangeValue | varchar | 50 | √ | 0 | 范围值 |  |
| Unit | varchar | 50 | √ | 0 | 单位 |  |
| LISTag | varchar | 50 | √ | 0 | lis的标记符，类似↑或者+之类的 |  |
| LISSign | varchar | 50 | √ | 0 |  |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 50 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |
| jcsj | varchar | 8000 | YES | NULL | 检查所见，一般填PACS检查详细描述 |  |
| ReportWarning | int | NULL | YES | ((0)) | 是否上报 1已上报 0未上报 |  |
| AbnormalType | varchar | 20 | YES | NULL | 质控-异常类型分类 ,A类、B类、其他异常 |  |
| AbnormalTypeCreateTime | varchar | 50 | YES | NULL | 质控-异常类型分类创建时间 |  |
| DiagnosticResult | varchar | 500 | YES | NULL | 诊断结果（诊断结论名） |  |
| IS\_UploadData | varchar | 10 | YES | NULL | 是否电测听职业史上报数据 1是 0 否 |  |

**VocaPatientExamItemPicture 检查项目图片表**

| VocaPatientExamItemPicture 检查项目图片表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_ExamItemPicture | int | 4 |  | 0 | 检查图片自增主键ID | √ |
| ID\_Depart | int | 4 | √ | 0 | 科室ID |  |
| ID\_Patient | int | 4 | √ | 0 | 体检者ID |  |
| PictureCode | varchar | 50 | √ | 0 | 图片编号,找工作站中图片用 |  |
| PictureUrl | varchar | 255 | √ | 0 | 图片URL |  |
| ID\_PatientExamItem | int | 4 | √ | 0 | 检查项流水表主键 |  |
| CollectionTime | varchar | 50 | √ | 0 | 采集时间 |  |
| ID\_Collection | int | 4 | √ | 0 | 采集人 |  |
| CollectionName | varchar | 50 | √ | 0 | 采集人姓名 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人ID |  |
| OperateName | varchar | 50 | √ | 0 | 操作人姓名 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 |  |
| IS\_State | int | 4 | √ | 0 | 1进报告 0不进报告 |  |
| FileType | int | 4 | √ | 0 | 文件类型：0/null:未知 1:pic 2:PDF 3：word ;4:excel;5:dicom |  |
| FileFrom | int | 4 |  | 0 | 文件来源：0:自动获取；1：手动上传 |  |

**VocaPatientExamItemSign 体检者体**

| VocaPatientExamItemSign 体检者体征词表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_PatientExamItemSign | int | 4 |  | 0 | 体检人员体征词流水主键ID | √ |
| ExamItemSignName | varchar | 200 | √ | 0 | 体征词名称 |  |
| ID\_Patient | int | 4 | √ | 0 | 体检者ID |  |
| ID\_PatientExamItem | int | 4 | √ | 0 | 体检者体检项目主键ID |  |
| ID\_ExamItemSign | int | 4 | √ | 0 | 体征词主键ID |  |
| ID\_SevereLevel | int | 4 | √ | 0 | 重症级别 |  |
| SignContent | varchar | 8000 | √ | 0 | 体征词已选结果模板 |  |
| SignValue | varchar | 8000 | √ | 0 | 体征词模板中提炼出来的文本结果,报告上显示 |  |
| DisplayOrder | varchar | 50 | √ | 0 | 显示顺序 |  |
| Describe | varchar | 8000 | √ | 0 | 描述 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人ID |  |
| OperateName | varchar | 50 | √ | 0 | 操作人姓名 |  |
|  |  |  |  |  |  |  |
| OperateTime | varchar | 50 | √ | 0 | 更改时间 |  |
| Note | nchar | 20 | √ | 0 | 备注 |  |

**VocaPatientFeeItem 业务收费项表**

| VocaPatientFeeItem 业务收费项表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_PatientFeeItem | int | 4 |  | 0 | 业务收费项表主键 | √ |
| ID\_Patient | int | 4 | √ | 0 | 人员表主键 |  |
| ID\_FeeItem | int | 4 | √ | 0 | 收费项字典的主键 |  |
|  |  |  |  |  |  |  |
| FeeItemName | varchar | 200 | √ | 0 | 收费项名称 |  |
| ID\_Depart | int | 4 | √ | 0 | 字典科室表主键 |  |
| DepartName | varchar | 50 | √ | 0 | 科室名称 |  |
| Price | numeric | 9 | √ | 2 | 应收金额 |  |
| FactPrice | numeric | 9 | √ | 2 | 实收金额 |  |
| ID\_Suit | int | 4 | √ | 0 | 套餐ID/组合项ID |  |
|  |  |  |  |  |  |  |
| IS\_SuitType | varchar | 5 | √ | 0 | 0/null:套餐项 1:组合项 2:单独增加项 3:加项 |  |
| IS\_FeeType | varchar | 5 | √ | 0 | 0/null:新加项,个人结算 1:团体统收项 |  |
| IS\_DataFrom | varchar | 5 | √ | 0 | 0/null:医院添加项 1:平台添加项 |  |
| IS\_Consum | int | 4 | √ | 0 | 是否耗材.<br> 0/null:非耗材<br> 1:耗材 |  |
| IS\_LisState | varchar | 5 | √ | 0 | 0或者null为新维护数据，1为已同步、2为采样、3为审核，<br>lis传输程序后续扩展（不同医院不同） |  |
| IS\_Register | varchar | 5 | √ | 0 | 0/null:未登记 1:已登记 |  |
| ID\_Register | int | 4 | √ | 0 | 登记人id |  |
| RegisterName | varchar | 50 | √ | 0 | 登记人名称 |  |
| RegisterTime | varchar | 50 | √ | 0 | 登记时间 |  |
| IS\_FeeState | varchar | 5 | √ | 0 | 0/null:未收 1:已收 2:拟退 4部分收（有限额卡支付，同已收，要视为已收） |  |
| ID\_FeeCharger | int | 4 | √ | 0 | 收费人id |  |
| FeeChargerName | varchar | 50 | √ | 0 | 收费人名称 |  |
| FeeChargerTime | varchar | 50 | √ | 0 | 收费时间 |  |
| IS\_Print | varchar | 5 | √ | 0 | 是否打印 0/null:未打印 1:已打印 |  |
| ID\_Print | int | 4 | √ | 0 | 打印人员ID |  |
| PrintName | varchar | 50 | √ | 0 | 打印人员姓名 |  |
| PrintTime | varchar | 50 | √ | 0 | 打印时间 |  |
| IS\_Examine | varchar | 5 | √ | 0 | 0/null:未发生 1:已检(有一个检查项开检就为已检) 2:延期(针对收费项) 3:弃检 |  |
| ID\_Examine | int | 4 | √ | 0 | 已检/延期/弃检操作人ID |  |
| ExamineName | varchar | 50 | √ | 0 | 已检/延期/弃检操作人名称 |  |
| ExamineTime | varchar | 50 | √ | 0 | 已检/延期/弃检操作时间 |  |
| DelayTime | varchar | 50 | √ | 0 | 延期时间 |  |
| ExamineReason | varchar | 200 | √ | 0 | 延期/弃检原因 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 50 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |
| ID\_SampleType | int | 4 | √ | 0 | 样本类型表主键 |  |
| SampleName | varchar | 50 | √ | 0 | 样本类型名称 |  |
| IS\_Replace | int | 4 | √ | 0 |  |  |
| Source | int | NULL | YES | NULL | 收费项来源：0/null 体软自身 1自助机  2 平台 |  |
| ID\_PayType | int | NULL | YES | NULL | 支付类型，已无用 |  |
| PayTypeStr | varchar | 50 | YES | NULL | 支付类型名称，已无用 |  |
| IsReExam | int | NULL | YES | NULL | 是否复检项 |  |
| VisitID | varchar | 50 | YES | NULL | 就诊id，接口插入，不使用时无意义 |  |
| PersonPrice | numeric | NULL | YES | ((0)) | 个人付费金额 |  |
| GroupPrice | numeric | NULL | YES | ((0)) | 单位付费金额 |  |
| ID\_GroupDetail | int | NULL | YES | NULL | 对应ReseGroupDetail主键，选择分组则有 |  |
| PaidScene | varchar | 5 | YES | ((1)) | 支付场景 1 本地，2 自助机 3 平台 |  |
| LimitDiscount | varchar | 100 | YES | ((0)) | 最低折扣，100分制，7折为70 |  |
| IS\_Suspend | int | NULL | YES | ((0)) | 0 未挂起，默认值 1挂起但当前已正常 2 挂起 |  |
| ID\_Suspend | int | NULL | YES | NULL | 挂起人id |  |
| SuspendName | varchar | 50 | YES | NULL | 挂起人 |  |
| SuspendTime | varchar | 50 | YES | NULL | 挂起时间 |  |
| IS\_ManualExamine | int | NULL | YES | ((0)) | 是否手动已检 1是 0否 |  |
| ID\_ManualExamine | int | NULL | YES | NULL | 手动已检操作人id |  |
| ManualExamineName | varchar | 50 | YES | NULL | 手动已检操作人 |  |
| ManualExamineTime | varchar | 50 | YES | NULL | 手动已检操作时间 |  |
| BarcodePrintFlag | varchar | 5 | YES | ((0)) | 条码打印状态 |  |
| BarcodePrintUserId | int | NULL | YES | NULL | 条码打印人id |  |
| BarcodePrintUserName | varchar | 255 | YES | NULL | 条码打印人 |  |
| BarcodePrintTime | varchar | 255 | YES | NULL | 条码打印时间 |  |
| BillPrintFlag | varchar | 5 | YES | ((0)) | 收费清单打印状态 |  |
| BillPrintUserId | int | NULL | YES | NULL | 收费清单打印人id |  |
| BillPrintUserName | varchar | 255 | YES | NULL | 收费清单打印人 |  |
| BillPrintTime | varchar | 255 | YES | NULL | 收费清单打印时间 |  |
| HalfPrice | numeric | NULL | YES | NULL | 半价金额？ |  |
| applyId | varchar | 50 | YES | NULL | 申请单id，接口插入，不用则无 |  |
| barCode | varchar | 50 | YES | NULL | 条码，接口插入，不用则无 |  |
| Check\_Form\_Printed\_Time | varchar |  | YES | NULL | 检查申请单打印时间 | 孟州民生 |
| Check\_Form\_Is\_Printed | int |  | YES | NULL | 检查申请单是否打印 | 孟州民生 |
| Check\_Form\_Printed\_Operator | varchar |  | YES | NULL | 检查申请单打印人 | 孟州民生 |

**VocaPatientConsumeItem 体检人物价**

| **VocaPatientConsumeItem 体检人物价表-****无论是否使用物价，都有，没有物价的时候使用默认的。修改价格一定要同步修改vpfi,vpci的** |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 默认值 | 说明 | 是否主键 |
| ID\_PatientConsumeItem | int | 4 | 0 | NULL |  | 是 |
| ID\_Patient | int | 4 | 1 | NULL | 体检人id，关联vp |  |
| ID\_PatientFeeItem | int | 4 | 1 | NULL | 用户收费项id，关联vpfi |  |
| ID\_ConsumeItem | int | 4 | 1 | NULL | 物价id，关联物价字典表DictConsumeItem |  |
| ConsumeItemName | varchar | 500 | 1 | NULL | 物价名称 |  |
| ConsumeItemCode | varchar | 100 | 1 | NULL | 物价编码 |  |
| FeeItemInterfaceCode | varchar | 100 | 1 | NULL | 收费项编码 |  |
| Quantity | float | 8 | 1 | NULL | 数量 |  |
| Price | numeric | 9 | 1 | NULL | 单价 |  |
| Discount | float | 8 | 1 | 1 | 折扣，默认1。但实际使用百分制，比如7折，会填入70 |  |
| FactPrice | numeric | 9 | 1 | NULL | 折后单价 |  |
| IS\_FeeState | varchar | 5 | 1 | NULL | 默认0，0/null:未收 1:已收 2:拟退 ，4 部分收费（有限额卡支付，同已收，要视为已收）同VPFI的IS\_FeeState字段 |  |
| IS\_FeeType | varchar | 5 | 1 | NULL | 同vpfi,<br> 0/null:新加项,个人结算 1:团体统收项 |  |
| ID\_FeeItem | int | 4 | 1 | NULL | 收费项id，对应dictfeeItem表 |  |
| IS\_HIS | varchar | 50 | 1 | NULL | 0或null为未发送，1为发送，2为退费 |  |
| HisCode | varchar | 500 | 1 | NULL | 接口添加，具体定义未知？ |  |
| PersonPrice | numeric | 9 | 1 | 0 | 个人付费金额(物价中个人付部分，不一定有用，具体看医院版本) |  |
| GroupPrice | numeric | 9 | 1 | 0 | 单位付费金额(物价中单位付部分，不一定有用，具体看医院版本) |  |
|  |  |  |  |  |  |  |

**VocaPatientFeeItemChangeDetail 体检人变动明细**

| **VocaPatientFeeItemChangeDetail 体检人变动明细表, 新的4.0医院添加** |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 默认值 | 说明 | 是否主键 |
| ID\_Detail | int | NULL | NO | NULL |  | 是 |
| ID\_Patient | int | NULL | YES | NULL | 体检人id |  |
| ID\_PatientFeeItem | int | NULL | YES | NULL | 体检人收费项id |  |
| ID\_FeeItem | int | NULL | YES | NULL | 收费项id |  |
| FeeItemName | varchar | 200 | YES | NULL | 收费项名称 |  |
| ID\_Depart | int | NULL | YES | NULL | 科室id |  |
| DepartName | varchar | 200 | YES | NULL | 科室名称 |  |
| Type | int | NULL | YES | NULL | 类型：1 删除 2 拟退 3 收费 |  |
| HisState | int | NULL | YES | NULL | his操作标记 接口自行确定 |  |
| ID\_Operate | int | NULL | YES | NULL |  |  |
| OperateName | varchar | 200 | YES | NULL |  |  |
| OperateTime | varchar | 20 | YES | NULL |  |  |
| IS\_FeeType | varchar | 5 | YES | NULL | 收费方式：1记账 0收费 |  |
| RegisterTime | varchar | 20 | YES | NULL | 登记时间 |  |
| Price | numeric | NULL | YES | NULL | 原价 单位分 |  |
| FactPrice | numeric | NULL | YES | NULL | 折后价 单位分 |  |
| GroupPrice | numeric | NULL | YES | NULL | 个人付部分金额 |  |
| PersonPrice | numeric | NULL | YES | NULL | 单位付部分金额 |  |
| ID\_PatientSheet | int | NULL | YES | NULL | 结账单id，对应cps |  |

**VocaPatientFeeStat 体检人统计表**

| **VocaPatientFeeStat-体检人统计表** |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 默认值 | 说明 | 是否主键 |
| ID\_Patient | int | NULL | NO | NULL | 体检人id | 是 |
| PatientCode | varchar | 20 | YES | NULL | 体检编号，一般没插入，需插入特殊处理。 |  |
| PreDiscountAmount | numeric | 18 | YES | NULL | 体检人所有项目-原价之和，单位分（不过注意有的医院的单位可能为元） |  |
| Amount | numeric | NULL | YES | NULL | 体检人所有项目-折后价之和，单位分（不过注意有的医院的单位可能为元） |  |
| TransferAmount | numeric | NULL | YES | ((0)) | 体检人转赠金额，单位分（不过注意有的医院的单位可能为元） |  |
| AbandonPrice | numeric | NULL | YES | ((0)) | 弃检金额，单位分（不过注意有的医院的单位可能为元） |  |
| PersonPrice | numeric | NULL | YES | ((0)) | 个人付部分金额，单位分（不过注意有的医院的单位可能为元） |  |
| GroupPrice | numeric | NULL | YES | ((0)) | 单位付部分金额，单位分（不过注意有的医院的单位可能为元） |  |
| AbandonFeeItems | varchar | 4000 | YES | ('') | 弃检收费项名称，英文逗号拼接 |  |
| PersonFeeItems | varchar | 4000 | YES | ('') | 收费收费项名称（IS\_FeeType=0），英文逗号拼接 |  |
| GroupFeeItems | varchar | 4000 | YES | ('') | 记账收费项名称（IS\_FeeType=1），英文逗号拼接 |  |
| Changed | int | NULL | YES | ((0)) | 统计是否需要刷新，登记、加项、删项、下发、弃检、重置等操作会将之变更为1。<br>刷新成功后变为0 |  |
| AbandonGroupPrice | numeric | NULL | YES | NULL | 弃检记账项目（IS\_FeeType=1）金额，单位分（不过注意有的医院的单位可能为元） |  |
| AbandonGroupFeeItems | varchar | 4000 | YES | NULL | 弃检记账项目（IS\_FeeType=1）收费项名称，英文逗号拼接 |  |
| OperateTime | varchar | 20 | YES | NULL | 操作人 |  |
| ChagAmount | numeric | NULL | YES | ((0)) | _自定义结算金额，单位分（不过注意有的医院的单位可能为元）_ |  |
| UseCustomChagAmount | int | NULL | YES | ((0)) | _是否使用自定义结算金额 1 是 0否 默认否_ |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |

**VocaPatientFollowUp 随访记录表****SampleTypeCodelle**

| VocaPatientFollowUp 随访记录表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_PatientFollowUp | int | 4 |  | 0 | 随访自增主键ID | √ |
| ID\_Patient | int | 4 | √ | 0 | 体检者ID |  |
| FollowUpTime | varchar | 50 | √ | 0 |  |  |
| FollowUpName | varchar | 50 | √ | 0 |  |  |
| FollowUpType | varchar | 20 | √ | 0 |  |  |
| FollowUpContent | varchar | 500 | √ | 0 |  |  |
| RechaeckTime | varchar | 50 | √ | 0 |  |  |
| IS\_State | varchar | 2 | √ | 0 | 是否启用 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人ID |  |
| OperateName | varchar | 50 | √ | 0 | 操作人姓名 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |

**VocaPatientGeneralHistory 三级总检历史结果**

| VocaPatientGeneralHistory 三级总检历史结果 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_GeneralHistory | int | 4 |  | 0 |  | √ |
| ID\_Patient | int | 4 | √ | 0 | 病人ID |  |
| PatientConclusions | varchar | 8000 | √ | 0 | 病人结论 |  |
| OcdConclusions | varchar | 8000 | √ | 0 | 职业病结论 |  |
| OcdFeeItems | varchar | 8000 | √ | 0 | 职业病复检项目 |  |
| clinicalLabResult | varchar | 8000 | √ | 0 | 检验科结果 |  |
| AddedConslusions | varchar | 4000 | √ | 0 | 补充结论 |  |
| Opinion | varchar | 4000 | √ | 0 | 处理意见 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人ID |  |
| Operate\_Name | varchar | 50 | √ | 0 | 操作人姓名 |  |
| Operate\_Time | varchar | 50 | √ | 0 | 操作人姓名 |  |
| ResultType | int | 4 | √ | 0 | 结果类型1：总检2：审核3：终审 |  |

**VocaPatientHealth 健康**

| VocaPatientHealth 健康证 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_PatientHealth | int | 4 |  | 0 |  | √ |
| ID\_Patient | int | 4 | √ | 0 |  |  |
| IS\_State | varchar | 50 | √ | 0 | 是否启用 |  |
| HealthNo | varchar | 500 | √ | 0 |  |  |
| ID\_Operate | int | 4 | √ | 0 | 打印人id |  |
| OperateName | varchar | 50 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
|  |  |  |  |  |  |  |

**VocaPatientSummary 体检人结论汇总表**

| VocaPatientSummary 体检人结论汇总表-总检、终审分别会插入更新。取消总检不会删除 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_Patient | int | NULL | YES | NULL | 体检人id |  |
| PatientCode | varchar | 20 | YES | NULL | 体检编号，此处没有插入值，无用 |  |
| PositiveValueSummary | text | 2.15E+09 | YES | NULL | 科室阳性结果拼接汇总。可改代码调整需要格式 |  |
| ConclusionSummary | text | 2.15E+09 | YES | NULL | 体检人所有阳性结论汇总 |  |
|  |  |  |  |  |  |  |

**VocaPatientInform 婚检**

| VocaPatientInform 婚检 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_Notification | int | 4 |  | 0 |  | √ |
| MarriageCheckYear | varchar | 50 | √ | 0 | 婚检年份 |  |
| MarriageCheckCode | varchar | 50 | √ | 0 | 婚检编码 |  |
| Check1 | int | 4 | √ | 0 |  |  |
| Check1Str | varchar | 5000 | √ | 0 |  |  |
| Check2 | int | 4 | √ | 0 |  |  |
| Check2Str | varchar | 5000 | √ | 0 |  |  |
| Check3 | int | 4 | √ | 0 |  |  |
| Check3Str1 | varchar | 5000 | √ | 0 |  |  |
| Check3Str2 | varchar | 5000 | √ | 0 |  |  |

**VocaPatientLabel 业务标签记录**

| VocaPatientLabel 业务标签记录 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_PatientLabel | int | 4 |  | 0 | 标签自增主键ID | √ |
| ID\_Patient | int | 4 | √ | 0 | 体检者ID |  |
| ID\_Label | int | 4 | √ | 0 | 标签自增主键ID |  |
| LabelName | varchar | 100 | √ | 0 | 标签名称 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人ID |  |
| OperateName | varchar | 50 | √ | 0 | 操作人姓名 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |

**VocaPatientOcd 职业病病人信息**

| VocaPatientOcd 职业病病人信息 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_PatientOcd | int | 4 |  | 0 |  | √ |
| ID\_Patient | int | 4 | √ | 0 | pateintID |  |
| OcdFactorId | varchar | 150 | √ | 0 | 危害因素ID |  |
| OcdFactorName | varchar | 500 | √ | 0 | 危害因素名称 |  |
| OcdFactorType | varchar | 200 | √ | 0 | 危害因素类型 |  |
| PositionStatus | varchar | 50 | √ | 0 | 岗位状态 |  |
| ID\_Operate | int | 4 | √ | 0 | 打印人id |  |
| OperateName | varchar | 50 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 200 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |

**VocaPatientOcdConclusion 职业病结论表**

| VocaPatientOcdConclusion 职业病结论表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_OcdConclusion | int | 4 |  | 0 |  | √ |
| ID\_Patient | int | 4 | √ | 0 |  |  |
| ID\_OcdDictConclusion | int | 4 | √ | 0 | 结论ID |  |
| ConclusionTypeCode | varchar | 50 | √ | 0 | 结论类型 |  |
| ConclusionName | varchar | 255 | √ | 0 | 结论名称 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| Operate\_Name | varchar | 50 | √ | 0 | 姓名 |  |
| Operate\_Time | varchar | 50 | √ | 0 | 操作时间 |  |
| suggestion | varchar | 8000 | √ | 0 | 建议 |  |

**VocaPatientOcdFeeItem 职业病收费项表****VocaPatientFeeItem**

| VocaPatientOcdFeeItem 职业病收费项表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_OcdFeeItem | int | 4 |  | 0 |  | √ |
| ID\_Patient | int | 4 | √ | 0 |  |  |
| ID\_DictFeeItem | int | 4 | √ | 0 | 收费项ID |  |
| FeeItemName | varchar | 255 | √ | 0 | 收费项名称 |  |
| OrderTime | varchar | 20 | √ | 0 |  |  |
| ID\_Operate | int | 4 | √ | 0 | 打印人id |  |
| Operate\_Name | varchar | 50 | √ | 0 | 姓名 |  |
| Operate\_Time | varchar | 50 | √ | 0 | 操作时间 |  |

**VocaPatientSampleType 体检者条码信息表**

| VocaPatientSampleType 体检者条码信息表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_PatientSampleType | int | 4 |  | 0 | 业务样本类型主键ID | √ |
| ID\_Patient | int | 4 | √ | 0 | 体检者ID |  |
| ID\_SampleType | int | 4 | √ | 0 | 样本ID |  |
| SampleTypeName | varchar | 50 | √ | 0 | 样本类型名称 |  |
| ID\_PatientFeeItem | int | 4 | √ | 0 | 体检人员收费项流水数据ID |  |
| IS\_State | varchar | 10 | √ | 0 | 是否已采样 |  |
| SampleTypeCode | varchar | 50 | √ | 0 | 样本条码号 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 50 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |

**VocaPatientSymptom 业务症状表**

| VocaPatientSymptom 业务症状表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_PatientSymptom | int | 4 |  | 0 |  | √ |
| ID\_Patient | int | 4 | √ | 0 |  |  |
| ID\_Symptom | int | 4 | √ | 0 | 症状id |  |
| SymPtomName | varchar | 50 | √ | 0 | 症状名称 |  |
| SymPtomValue | int | 4 | √ | 0 | 是否有此症状：1有2无 |  |
| DisplayOrder | varchar | 50 | √ | 0 | 排序序号，为了支持中途添加，暂设定为字符串类型，注意：会出现9>10的情况 |  |
| ID\_Operate | int | 4 | √ | 0 | 打印人id |  |
| OperateName | varchar | 50 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 50 | √ | 0 | 备注 |  |

**VocaPatientTrans 接口数据传输记录表**

| VocaPatientTrans 接口数据传输记录表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_PatientTrans | int | 4 |  | 0 | 接口数据传输主键 | √ |
| ID\_Patient | int | 4 | √ | 0 | 体检者ID |  |
| PatientCode | varchar | 50 | √ | 0 | 体检者条码 |  |
| HIS | int | 4 | √ | 0 |  |  |
| PACS | int | 4 | √ | 0 |  |  |
| LIS | int | 4 | √ | 0 | LIS数据传输<br> 0/null/没有数据:未传输<br> 1:已传输 |  |
| OperateTime | varchar | 50 | √ | 0 | 数据传输时间 |  |

**VocaPatientTrans 接口数据传输记录表**

| VocaPatientTrans 接口数据传输记录表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_PatientTrans | int | 4 |  | 0 | 接口数据传输主键 | √ |
| ID\_Patient | int | 4 | √ | 0 | 体检者ID |  |
| PatientCode | varchar | 50 | √ | 0 | 体检者条码 |  |
| HIS | int | 4 | √ | 0 |  |  |
| PACS | int | 4 | √ | 0 |  |  |
| LIS | int | 4 | √ | 0 | LIS数据传输<br> 0/null/没有数据:未传输<br> 1:已传输 |  |
| OperateTime | varchar | 50 | √ | 0 | 数据传输时间 |  |

**VocaReportMeun 自定义报表菜单对应表**

| VocaReportMeun 自定义报表菜单对应表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| MenuCode | varchar | 255 | √ | 0 | 菜单 uuid |  |
| ID\_Report | int | 4 | √ | 0 | 自定义报表主表自增ID |  |
| DisplayOrder | varchar | 20 | √ | 0 | 顺序 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人ID |  |
| OperateName | varchar | 255 | √ | 0 | 操作人姓名 |  |
| OperateTime | varchar | 30 | √ | 0 | 操作时间 |  |
| Note | varchar | 255 | √ | 0 | 备注 |  |
| ID\_ReportMenu | int | 4 |  | 0 | 自定义报表对应菜单的自增主键ID | √ |

**VocaReportParameter 自定义报表查询**

| VocaReportParameter 自定义报表查询参数表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_ReportParameter | int | 4 |  | 0 | 参数自增ID | √ |
| ID\_Report | int | 4 | √ | 0 | 自定义报表主表自增ID |  |
| ViewColumn | varchar | 50 | √ | 0 | 参数的中文意思 |  |
| FieldColumn | varchar | 50 | √ | 0 | sql 中字段的名称 |  |
| CommBoxCode | varchar | 20 | √ | 0 | 组件类型<br> 下拉: selecte,<br> 输入:text.<br> 时间:sdate,mdate,<br> 分页:pageno,pagesize |  |
| CommBoxValue | varchar | 8000 | √ | 0 | 手动设置时为JSON sql时为sql语句 |  |
| DisplayOrder | varchar | 50 | √ | 0 | 顺序 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人ID |  |
| OperateName | varchar | 200 | √ | 0 | 操作人姓名 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |
| GroupCode | varchar | 10 | √ | 0 | 组件类型为mdate才会使用,时间查询是否为一组 |  |
| CommBoxType | varchar | 2 | √ | 0 | 下拉设置值的类型, 1:手工设置, 2:外部sql |  |

| VocaReportView 自定义报表查询内容显示表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_ReportView | int | 4 |  | 0 | 显示列的自增主键ID | √ |
| ID\_Report | int | 4 | √ | 0 | 自定义报表主表自增ID |  |
| ViewColumn | varchar | 50 | √ | 0 | 表格中显示的中文释义 |  |
| FieldColumn | varchar | 50 | √ | 0 | sql中的字段 |  |
| ColumnWidth | varchar | 50 | √ | 0 | 显示的列的宽度 |  |
| DisplayOrder | varchar | 10 | √ | 0 | 顺序 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人ID |  |
| OperateName | varchar | 200 | √ | 0 | 操作人姓名 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |
| IS\_Show | varchar | 2 | √ | 0 | 是否显示 0:不显示, 1:显示 |  |
| SubReport | varchar | 255 | √ | 0 | 级联报表参数 |  |

| VocaSendRecord 报告发送记录 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_SendRecord | int | 4 |  | 0 | 发送自增主键 | √ |
| ID\_Record | int | 4 | √ | 0 | 发送记录ID，团体为ID\_Task，个人为ID\_Patient |  |
| RecordType | varchar | 10 | √ | 0 | 发送类别，0个人，1团体 |  |
| ID\_Org | int | 4 | √ | 0 | 单位id |  |
| OrgName | varchar | 255 | √ | 0 | 单位名称 |  |
| SendType | varchar | 10 | √ | 0 | 发送方式类别 1到院自取，2邮寄，3电子邮件 |  |
| SendAddress | varchar | 500 | √ | 0 | 发送地址 |  |
| ReceivedName | varchar | 50 | √ | 0 | 收件人 |  |
| Explain | varchar | 500 | √ | 0 | 备注 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人ID |  |
| OperateName | varchar | 50 | √ | 0 | 操作人姓名 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 |  |
| note | varchar | 500 | √ | 0 | 备注 |  |
| IS\_State | varchar | 10 | √ | 0 | 发送状态，0已发送，1发送失败 |  |
| DetailAddress | varchar | 500 | √ | 0 | 发送详细地址 |  |