# 费用表（chag）

**ChagApply 票据申领表**

| ChagApply 票据申领表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_Apply | int | 4 |  | 0 | 票据申领表id | √ |
| ID\_Repertory | int | 4 | √ | 0 | 票据库存表id |  |
| MinNum | int | 4 | √ | 0 | 最小票号 |  |
| MaxNum | int | 4 | √ | 0 | 最大票号 |  |
| CrtNm | int | 4 | √ | 0 | 当前票号（票据打印频繁访问，需要按当前的收费员动态取） |  |
| IS\_State | varchar | 5 | √ | 0 | 票段使用状态0未使用，1正在使用，2已用完,3:已停用 |  |
| ID\_Receive | int | 4 | √ | 0 | 申领人id |  |
| ReceiveName | varchar | 50 | √ | 0 | 申领人名称 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 50 | √ | 0 | 操作人名称 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 |  |
| note | varchar | 500 | √ | 0 | 备注 |  |

 **ChagInvoice 票据打印流水表**

| ChagInvoice 票据打印流水表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_Invoice | int | 4 |  | 0 | 票据打印流水表主键 | √ |
| Price | numeric | 9 | √ | 2 | 票据金额 |  |
| IS\_InvoiceType | varchar | 5 | √ | 0 | 0个人1为团体 |  |
| IS\_PrintType | varchar | 5 | √ | 0 | （0为已打印，1为作废 新生成默认为0） |  |
| InvoiceNum | varchar | 50 | √ | 0 | 票据号 |  |
| ID\_Operate | int | 4 | √ | 0 | 打印人id |  |
| OperateName | varchar | 50 | √ | 0 | 打印人名称 |  |
| OperateTime | varchar | 50 | √ | 0 | 打印时间 |  |
| note | varchar | 500 | √ | 0 | 备注 |  |

**ChagInvoice\_Pay** 

| ChagInvoice\_Pay |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_Invoice\_Pay | int | 4 |  | 0 |  | √ |
| ID\_Invoice | int | 4 | √ | 0 |  |  |
| ID\_Pay | int | 4 | √ | 0 |  |  |
| IS\_InvoiceType | varchar | 5 | √ | 0 |  |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人ID |  |
| OperateName | varchar | 50 | √ | 0 | 操作人姓名 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 |  |
| note | varchar | 500 | √ | 0 | 备注 |  |

**ChagOrgPay 团体付款表**

| ChagOrgPay 团体付款表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_OrgPay | int | 4 |  | 0 | 团体付款表主键 | √ |
| SumPay | numeric | 9 | √ | 2 | 应付金额=勾选结算单金额合计 |  |
| FactPay | numeric | 9 | √ | 2 | 实付金额，默认为应付，可以折扣 |  |
| PrePay | numeric | 9 | √ | 2 | 当前付款的预付金额，<=总预付 |  |
| CashPay | numeric | 9 | √ | 2 | 现金支付金额=FactPay-PrePay |  |
| PayTypeStr | varchar | 50 | √ | 0 | 支付方式说明 |  |
| BusinessOrderNo | varchar | 64 | √ | 0 | 业务订单号 |  |
| Payer | varchar | 50 | √ | 0 | 付款人 |  |
| Phone | varchar | 50 | √ | 0 | 联系方式 |  |
| ID\_Org | int | 4 | √ | 0 | 团体ID |  |
| OrgName | varchar | 100 | √ | 0 | 团体名称 |  |
| ID\_FeeCharger | int | 4 | √ | 0 | 收费员ID |  |
| FeeChargerName | varchar | 50 | √ | 0 | 收费人姓名 |  |
| FeeChargerTime | varchar | 50 | √ | 0 | 收费项时间 |  |
| ID\_Invoice | int | 4 | √ | 0 | 票据打印流水表主键 |  |
| Explain | varchar | 500 | √ | 0 | 说明 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 50 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| note | varchar | 500 | √ | 0 | 备注 |  |

**ChagOrgSheet 团体结算单**

| ChagOrgSheet 团体结算单 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_OrgSheet | int | 4 |  | 0 | 团体结算单表主键 | √ |
| ID\_OrgPay | int | 4 | √ | 0 | 付款单id --付款时反打 |  |
| OrgSheetName | varchar | 50 | √ | 0 | 结算单名称 |  |
| ID\_Task | int | 4 | √ | 0 | 任务ID |  |
| Amount | numeric | 9 | √ | 2 | 金额 |  |
| SettlementOrderNo | varchar | 64 | √ | 0 | 结算单号 |  |
| IS\_State | varchar | 5 | √ | 0 | 0或者null 已结算；1:已付款 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 50 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| note | varchar | 500 | √ | 0 | 备注 |  |

**ChagPatientSheet 个人收费单表**

| ChagPatientSheet 个人收费单表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字长度 | 是否可以为空 | 精确位/默认值 | 说明 | 是否主键 |
| ID\_PatientSheet | int | 4 |  | 0 | 个人收费单表主键 | √ |
| ID\_Patient | int | 4 | √ | 0 | 人员表主键 |  |
| PatientName | varchar | 50 | √ | 0 | 体检者名称 |  |
| SumAmount | numeric | 9 | √ | 2 | 应收的实付金额，<br>个收不支持在收费处打折，<br>是在业务表打折。 |  |
| SettlementOrderNo | varchar | 64 | √ | 0 | 订单号，全退再收版本： 账单id拼接，英文逗号拼接 |  |
| ID\_PayType | int | 4 | √ | 0 |  |  |
| PayTypeStr | varchar | 50 | √ | 0 | 收费方式说明，目前无实际意义 | 大凌河　<br>case when cps.PayTypeStr = 'alipay' then '统一支付（支付宝）'  when cps.PayTypeStr = 'wechat' then '统一支付（微信）' when cps.PayTypeStr is null then '退费' end as '支付方式',  sum( CONVERT(decimal(8,2),cps.SumAmount/100) ) as '金额'<br>from ChagPatientSheet cps<br>where FeeChargerTime between '2025-11-05 00:00:00' AND '2025-11-06 00:00:00' and cps.PresId like '%p%' group by cps.PayTypeStr |
| ID\_FeeCharger | int | 4 | √ | 0 | 收费员id |  |
| FeeChargerName | varchar | 50 | √ | 0 | 收费员名称 |  |
| FeeChargerTime | varchar | 50 | √ | 0 | 收费时间 |  |
| IS\_FeeState | varchar | 5 | √ | 0 | 0或null为新加数据1为已收 |  |
| Explain | varchar | 500 | √ | 0 | 说明 |  |
| ID\_Invoice | int | 4 | √ | 0 | 票据打印流水表主键 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 50 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |
| IS\_Pay | int | NULL | YES | NULL | 是否支付中 1支付中 0未支付中<br>2 已支付 |  |
| RedinkInvoice | varchar | 50 | YES | NULL | 冲红发票？目前应该没有 |  |
| IS\_PLATFORM | varchar | 5 | YES | NULL | 1.  是否平台支付项目生成的账单 1是 0/null 否 |  |
| GroupAmount | numeric | NULL | YES | ((0)) | 单位付费金额 |  |
| PaidAmount | numeric | NULL | YES | ((0)) | 已付金额 |  |
| SheetType | int | NULL | YES | ((0)) | 0 默认合单账单 1退款账单 2收款账单（部分版本） |  |
| Pair | int | NULL | YES | ((0)) | 是否一对账单 1是 0否<br>比如收退费同时存在就是一对账单，一对账单必须同时完结 |  |
| PresId | varchar | 255 | YES | NULL | 处方id，退费单也是原收费单的presId的逗号拼接。 <br>泸州：为划价后的his接口返回的fee\_no |  |
| PresListId | varchar | 50 | YES | NULL | 接口添加？ |  |
| IS\_HisState | int | NULL | YES | NULL | 0 未划价（默认）<br>1 划价中<br>2 撤销重新划价中<br>3 已划价<br>4 结账中（接收到his的结算通知时变更）<br>5. 已结账（退费、收费都是结账）<br>9.异常 |  |
| Changed | int | NULL | YES | NULL | 是否已变更 1已变更 0未变更 |  |
| SendOrderNos | varchar | 255 | YES | NULL | 已发送给his的SettlementOrderNo。<br>多个由逗号拼接而成 |  |
| ChargedOrderNos | varchar | 255 | YES | NULL | 已结算的SettlementOrderNo，<br>只有SettlementOrderNo= ChargedOrderNos时，表示已结算完成。IS\_hisState设为5 |  |
| HisTime | varchar | 50 | YES | NULL | his发送时间 |  |
| Refunded | int | NULL | YES | NULL | ？接口添加？ |  |
| RevertFromHis | int | NULL | YES | ((0)) | 是否从his撤回账单，<br>0 无需<br>1 需要撤回<br>2 撤回成功 |  |
| His\_State | int | NULL | YES | ((0)) | ？ |  |

**ChagPatientSheetDetail 个人收费单明细表**

| ChagPatientSheetDetail 个人或团体加项的收费单明细表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位or默认值 | 说明 | 是否主键 |
| ID\_PatientSheetDetail | int | 4 |  | 0 | 个人收费单明细主键 | √ |
| ID\_PatientSheet | int | 4 | √ | 0 | 个人收费单主键 |  |
| ID\_Patient | int | 4 | √ | 0 | 人员表主键 |  |
| ID\_FeeItem | int | 4 | √ | 0 | 收费项字典的主键 |  |
| FeeItemName | varchar | 200 | √ | 0 | 收费项名称 |  |
| ID\_PatientFeeItem | int | 4 | √ | 0 | 业务收费项表主键 |  |
| IS\_State | int | 4 | √ | 0 | 0/null:新加项<br> 2:拟退项 |  |
| Price | numeric | 9 | √ | 2 | 原价 |  |
| FactPrice | numeric | 9 | √ | 2 | 实收金额 |  |
| DepartName | varchar | 50 | √ | 0 | 科室名称 |  |
| IS\_SuitType | varchar | 5 | √ | 0 | 项目来源 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 50 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |
| GroupPrice | numeric | NULL | YES | ((0)) | 单位付费金额-限额抵扣部分 |  |
| IS\_Extend | int | NULL | YES | ((0)) | 是否是额外用来抵充的收费项 1 是 0 否。全退再收中，非真正退的就是抵充项 |  |
| PaidPrice | numeric | NULL | YES | ((0)) | 已付金额 |  |
| hisDetailId | varchar | 50 | YES | NULL | 接口添加， |  |
| extend1 | varchar | 50 | YES | NULL | 接口添加， |  |
| extend2 | varchar | 50 | YES | NULL | 接口添加， |  |
| extend3 | varchar | 50 | YES | NULL | 接口添加， |  |

**ChagPatientSheetConsume** **个人收费单明细物价表**

| ChagPatientSheetConsume 个人收费单明细物价表 |  |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 |  | 精确位 | 说明 | 是否主键 |
| ID\_PatientSheetConsume | int | NULL | NO |  | NULL |  | 是 |
| ID\_PatientSheet | int | NULL | NO |  | NULL | 个人账单id |  |
| ID\_PatientFeeItem | int | NULL | NO |  | NULL | 体检人收费项id |  |
| ID\_ConsumeItem | int | NULL | YES |  | NULL | 物价id |  |
| ConsumeItemCode | varchar | 50 | YES |  | NULL | 物价编码 |  |
| FactPrice | numeric | NULL | YES |  | NULL | 折后价-个人支付部分 |  |
| GroupPrice | numeric | NULL | YES |  | ((0)) | 折后价-限额抵扣部分 |  |
| Is\_Paid | int | NULL | YES |  | ((0)) | 是否已支付 |  |
|  |  |  |  |  |  |  |  |

**ChagPatientSheetDeleted 直接删除的cps表,用户接口撤销payzhi夫**

| ChagPatientSheetDeleted 直接删除的cps表,用户接口撤销 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_PatientSheet | int | NULL | NO | NULL |  |  |
| ID\_Patient | int | NULL | YES | NULL | 体检人id |  |
| PatientName | varchar | 50 | YES | NULL | 体检人名称 |  |
| SumAmount | numeric | NULL | YES | NULL | 被直接删除的账单金额 |  |
| GroupAmount | numeric | NULL | YES | ((0)) | 单位付费金额-预计被限额抵扣的部分 |  |
| PaidAmount | numeric | NULL | YES | ((0)) | 已付金额 |  |
| SettlementOrderNo | varchar | 64 | YES | NULL | 同cps该字段 |  |
| ID\_Operate | int | NULL | YES | NULL |  |  |
| OperateName | varchar | 50 | YES | NULL |  |  |
| OperateTime | varchar | 50 | YES | NULL |  |  |
| Note | varchar | 500 | YES | NULL | 备注 |  |
| IS\_Pay | int | NULL | YES | NULL | 是否支付中 1是 0 否 |  |
| IS\_PLATFORM | varchar | 5 | YES | NULL | 是否平台支付项目生成的账单 1是 0/null否 |  |
| SheetType | int | NULL | YES | ((0)) | 0 默认合单账单 1退款账单 2收款账单 |  |
| Pair | int | NULL | YES | ((0)) | 同cps |  |
| PresId | varchar | 50 | YES | NULL |  |  |
| IS\_HisState | int | NULL | YES | ((0)) |  |  |
| Count\_State | int | NULL | YES | ((0)) |  |  |
| Changed | int | NULL | YES | NULL |  |  |
| HisTime | varchar | 50 | YES | NULL |  |  |

**ChagPatientSheetDeletedDetail 已删除账单的****明细表**

| ChagPatientSheetDeletedDetail 已删除账单的明细表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_PatientSheetDetail | int | NULL | NO | NULL |  |  |
| ID\_PatientSheet | int | NULL | YES | NULL | cpsd对应的账单ID |  |
| ID\_Patient | int | NULL | YES | NULL | 体检人id |  |
| ID\_FeeItem | int | NULL | YES | NULL | 收费项id |  |
| FeeItemName | varchar | 500 | YES | NULL | 收费项名称 |  |
| ID\_PatientFeeItem | int | NULL | YES | NULL | 体检人收费项id |  |
| IS\_State | int | NULL | YES | NULL |  |  |
| Price | numeric | NULL | YES | NULL | 折后价之和 |  |
| FactPrice | numeric | NULL | YES | NULL | 折后价-个人付部分 |  |
| GroupPrice | numeric | NULL | YES | ((0)) | 单位付费金额-预计限额抵扣部分 |  |
| PaidPrice | numeric | NULL | YES | ((0)) | 已付金额 |  |
| Note | varchar | 500 | YES | NULL | 备注 |  |

**ChagPatientFeeItemLastedFee** **个人已收费项目具体金额表**

| ChagPatientFeeItemLastedFee 个人已收费项目具体金额表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_PatientFeeItem | int | 4 | 1 | NULL | 体检人收费项ID |  |
| ID\_PatientSheet | int | 4 | 1 | NULL | 结算的账单ID |  |
| ID\_Patient | int | 4 | 1 | NULL | 体检人id |  |
| Price | numeric | 9 | 1 | NULL | 项目折后价 |  |
| FactPrice | numeric | 9 | 1 | NULL | 折后价-个人支付部分 |  |
| GroupPrice | numeric | 9 | 1 | NULL | 折后价-限额抵扣部分 |  |
| HasCardFee | tinyint | 1 | 1 | NULL | 是否限额卡（或者电子卡）支付 1是 0否 |  |
| ID\_PatientConsumeItem | int | 4 | 0 | NULL | 体检人物价id | 是 |
| IS\_FeeType | varchar | 5 | 1 | NULL | 收费类型  1记账 0/null 收费 |  |
| PresId | varchar | 50 | 1 | NULL | his账单id |  |

ChagPayFlow 支付流水表

| ChagPayFlow 支付流水表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_PayFlow | int | 4 |  | 0 | 主键 | √ |
| ID\_Business | int | 4 | √ | 0 | 业务id |  |
| BusinessOrderNo | varchar | 64 | √ | 0 | 业务订单号 |  |
| ThirdOrderNo | varchar | 64 | √ | 0 | 第三方订单号 |  |
| PrePay | numeric | 9 | √ | 2 | 支付金额 |  |
| PayType | varchar | 50 | √ | 0 | 支付类型 |  |
| OrderType | varchar | 50 | √ | 0 | 订单业务类型1充值2退款3抵扣 |  |
| IS\_State | varchar | 50 | √ | 0 | 支付状态，0未完成，1已完成 |  |
| BusinessType | varchar | 50 | √ | 0 | 1预缴，2团队缴费，3个人或团队加项 |  |
| ID\_Operate | int | 4 | √ | 0 | 修改人ID |  |
| OperateName | varchar | 50 | √ | 0 | 修改名称 |  |
| OperateTime | varchar | 50 | √ | 0 | 修改时间 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |

**ChagPrePayFlow 预付金额明细表**

| ChagPrePayFlow 预付金额明细表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_PrePayFlow | int | 4 |  | 0 | 预付金额明细表 主键 | √ |
| ID\_Org | int | 4 | √ | 0 | 单位 ID |  |
| Amount | numeric | 9 | √ | 2 | 金额 |  |
| PayType | varchar | 50 | √ | 0 | 支付类型 |  |
| BusinessOrderNo | varchar | 64 | √ | 0 | 业务订单号 |  |
| IS\_State | varchar | 50 | √ | 0 | 支付状态，0未完成，1已完成 |  |
| OrderType | varchar | 50 | √ | 0 | 订单类型 |  |
| Payer | varchar | 50 | √ | 0 | 付款人 |  |
| Phone | varchar | 50 | √ | 0 | 联系方式 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 50 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Explain | varchar | 500 | √ | 0 | 说明 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |

**ChagRepertory 票据库存表**

| ChagRepertory 票据库存表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_Repertory | int | 4 |  | 0 | 票据库存表id | √ |
| RepertoryName | varchar | 50 | √ | 0 | 库存名称 |  |
| PrefixNum | varchar | 20 | √ | 0 | 票据前缀 |  |
| SuffixNum | varchar | 20 | √ | 0 | 票据后缀 |  |
| MinNum | int | 4 | √ | 0 | 最小票号 |  |
| MaxNum | int | 4 | √ | 0 | 最大票号 |  |
| InStorageQuantity | varchar | 11 | √ | 0 | 入库数量 |  |
| RemainingQuantity | varchar | 11 | √ | 0 | 剩余数量 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 50 | √ | 0 | 操作人名称 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 |  |
| note | varchar | 500 | √ | 0 | 备注 |  |

**ChagPayDetail  支付流水表-只用于个人账单cps**

| ChagPayDetail 支付流水表-只用于个人账单cps |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_ChagPayDetail | int | 4 |  | 0 | 主键 | √ |
| ID\_Patient | int | 4 | √ | 0 | 病人主键 |  |
| ID\_PatientSheet | int | 4 | √ | 0 | 结账单主键 |  |
| SumAmount | numeric | 9 | √ | 2 | 该笔订单金额 | 支付金额，单位分 |
| ID\_PayType | int | 4 | √ | 0 | 支付类型ID | 4现金<br>7 电子卡-储值卡<br>3 银行卡<br>10 电子卡-一次性消费卡 |
| PayTypeStr | varchar | 50 | √ | 0 | 支付类型中文说明 |  |
| OrderNo | varchar | 200 | √ | 0 | 支付订单号 |  |
| RefundNo | varchar | 200 | √ | 0 | 退款单号 |  |
| IS\_State | int | 4 | √ | 0 | 0/null:未支付（拟支付） 1:已支付/已退款<br> 2：支付中 | 0表示对应的cps为结算<br>1 表示对应的cps已结算 |
| ~~ID\_FeeCharger~~ | ~~int~~ | ~~4~~ | ~~√~~ | ~~0~~ | ~~收款人ID~~ |  |
| ~~FeeChargerName~~ | ~~varchar~~ | ~~50~~ | ~~√~~ | ~~0~~ | ~~收款人姓名~~ |  |
| ~~FeeChargerTime~~ | ~~varchar~~ | ~~50~~ | ~~√~~ | ~~0~~ | ~~收款时间~~ |  |
| Exp\_Reason | varchar | 200 | YES | NULL | 支付说明 |  |
| Source | int | NULL | YES | ((0)) | 来源 2 平台 0/null体软 |  |
| CardNo | varchar | 30 | YES | NULL | 支付电子卡卡号 |  |
| ID\_Operate | int | NULL | YES | NULL | 支付人ID |  |
| OperateName | varchar | 50 | YES | NULL | 支付人姓名 |  |
| OperateTime | varchar | 50 | YES | NULL | 支付时间 |  |