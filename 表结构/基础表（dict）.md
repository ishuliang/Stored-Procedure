# 基础表（dict）

**DictConclusion 字典结论表**

| DictConclusion 字典结论表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_Conclusion | int | 4 |  | 0 | 字典结论表主键 | √ |
| ConclusionName | varchar | 8000 | √ | 0 | 结论词名称 |  |
| BriefCode | varchar | 8000 | √ | 0 | 简码 |  |
| Suggest | varchar | 8000 | √ | 0 | 结论建议 |  |
| ID\_SevereLevel | int | 4 | √ | 0 | 重症级别 |  |
| InterfaceCode1 | varchar | 50 | √ | 0 | 一般录ICD10编码，可以为空 |  |
| InterfaceCode2 | varchar | 50 | √ | 0 | 预留 |  |
| IS\_MergeLevel | float | 8 | √ | 0 | 已合并的结论词权重 默认:0 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 200 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |
| IS\_State | varchar | 5 | √ | 0 | 是否启用<br>是否显示 0不显示 1显示 ，默认为显示 |  |

**DictConclusionMerge 合并结论词关系表**

| DictConclusionMerge 合并结论词关系表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_ConclusionMerge | int | 4 |  | 0 | 合并结论词表主键ID | √ |
| ID\_MergeConclusion | int | 4 | √ | 0 | 合并后的结论词ID |  |
| ID\_Conclusion | int | 4 | √ | 0 | 待合并的结论词ID |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人ID |  |
| OperateName | varchar | 200 | √ | 0 | 操作人名称 |  |
| OperateTime | varchar | 50 | √ | 0 | 更改时间 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |

**DictDepart 字典科室表**

| DictDepart 字典科室表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_Depart | int | 4 |  | 0 | 字典科室表主键 | √ |
| DepartName | varchar | 200 | √ | 0 | 科室名称 |  |
| DepartType | varchar | 50 | √ | 0 | 科室类型，因为科室类型参与计算，所以不是动态添加的，固定类型：LIS为检验科；<br>PACS为带图片的科室；空或者其他字符暂处理为普通科室 |  |
| FileLocation | varchar | 500 | √ | 0 | 工作站式接口的对应地址，初期开发需要支持共享、ftp、http3种方式 |  |
| Summary | varchar | 2000 | √ | 0 | 默认小结 |  |
| BriefCode | varchar | 50 | √ | 0 | 输入码，软件支持在任何地方支持首字母快捷录入功能，输入码调用标量函数F\_getBriefCode获取，推荐提交时动态获取 |  |
| DisplayOrder | varchar | 20 | √ | 0 | 排序序号，为了支持中途添加，暂设定为字符串类型，注意：会出现9>10的情况 |  |
| IS\_State | varchar | 5 | √ | 0 | 0弃用 1启用 2平台可访问 新增默认是1 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 200 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |

**DictDepartError 字典科室错误信息****DictFeeItem**

| DictDepartError 字典科室错误信息 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_Depart | int | 4 |  | 0 | 科室ID | √ |
| DepartName | varchar | 200 | √ | 0 | 科室名称 |  |
| DepartType | varchar | 50 | √ | 0 | 科室类型，因为科室类型参与计算，所以不是动态添加的，固定类型：LIS为检验科；<br>PACS为带图片的科室；空或者其他字符暂处理为普通科室 |  |
| FileLocation | varchar | 500 | √ | 0 | 工作站式接口的对应地址，初期开发需要支持共享、ftp、http3种方式 |  |
| Summary | varchar | 2000 | √ | 0 | 默认小结 |  |
| DisplayOrder | varchar | 20 | √ | 0 | 显示顺序 |  |
| IS\_State | varchar | 5 | √ | 0 | 是否启用 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |
| ErrorMsg | varchar | 100 | √ | 0 | 错误日志 |  |

**DictExamItem 字典检查项表**

| DictExamItem 字典检查项表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_ExamItem | int | 4 |  | 0 | 字典检查项表主键 | √ |
| ExamItemName | varchar | 2003 | √ | 0 | 检查项名称 |  |
| BriefCode | varchar | 50 | √ | 0 | 输入码，软件支持在任何地方支持首字母快捷录入功能，<br>输入码调用标量函数F\_getBriefCode获取，推荐提交时动态获取 |  |
| InterfaceCode1 | varchar | 20 | √ | 0 | lis对应的检查项编码，需要实施人员现场维护 |  |
| InterfaceCode2 | varchar | 20 | √ | 0 | 平台约定，例如身高体重特殊性的检查项编码 |  |
| InterfaceCode3 | varchar | 20 | √ | 0 | 预留 |  |
| ID\_Depart | int | 4 | √ | 0 | 字典科室表主键 |  |
| ValueType | varchar | 5 | √ | 0 | 结果类型，重要字段！1为录入型结果，比如身高体重和检验科回传的数据；<br>2为计算型结果，比如检查项叫血压结论的，或者大小三阳的产生;<br>3 为体征型结果，此检查项不可录入结果，只能通过体征录入结果； |  |
| Unit | varchar | 10 | √ | 0 | 计量单位 |  |
| Formula | varchar | 4000 | √ | 0 | 公式，这里需要设计算法，一个跨检查项联合产生结论参考ValueType的2类型 |  |
| FormulaCon | varchar | 4000 | √ | 0 | 结论词生成公式 |  |
| Preci | varchar | 5 | √ | 0 | 精度,保留几位小数 |  |
| MaleMax | varchar | 20 | √ | 0 | 男最大值（暂不支持多级数值的结论计算，项目需要的话，单独建表实现） |  |
| MaleMin | varchar | 20 | √ | 0 | 男最小值 |  |
| FemaleMax | varchar | 20 | √ | 0 | 女最大值 |  |
| FemaleMin | varchar | 20 | √ | 0 | 女最小值 |  |
| DisplayOrder | varchar | 50 | √ | 0 | 排序序号，为了支持中途添加，暂设定为字符串类型，注意：会出现9>10的情况 |  |
| IS\_State | varchar | 50 | √ | 0 | 是否启用 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 200 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |

**DictExamItemError 字典检查项错误信息表**

| DictExamItemError 字典检查项错误信息表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_ExamItem | int | 4 |  | 0 |  | √ |
| ExamItemName | varchar | 200 | √ | 0 | 检查项名称 |  |
| InterfaceCode1 | varchar | 20 | √ | 0 | lis对应的检查项编码，需要实施人员现场维护 |  |
| InterfaceCode2 | varchar | 20 | √ | 0 | 平台约定，例如身高体重特殊性的检查项编码 |  |
| InterfaceCode3 | varchar | 20 | √ | 0 | 预留 |  |
| ID\_Depart | int | 4 | √ | 0 | 科室ID |  |
| ValueType | varchar | 5 | √ | 0 | 结果类型，重要字段！1为录入型结果，比如身高体重和检验科回传的数据；<br>2为计算型结果，比如检查项叫血压结论的，或者大小三阳的产生;<br>3 为体征型结果，此检查项不可录入结果，只能通过体征录入结果； |  |
| IS\_State | varchar | 5 | √ | 0 | 是否启用 |  |
| DisplayOrder | varchar | 50 | √ | 0 | 显示顺序 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |
| ErrorMsg | varchar | 200 | √ | 0 | 错误信息 |  |
| DeptName | varchar | 50 | √ | 0 | 科室名称 |  |

**DictExamItemSign 字典体征词表**

| DictExamItemSign 字典体征词表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_ExamItemSign | int | 4 |  | 0 | 字典体征表主键 | √ |
| ExamItemSignName | varchar | 200 | √ | 0 | 体征词名称 |  |
| ID\_ExamItem | int | 4 | √ | 0 | 字典检查项表主键 |  |
| BriefCode | varchar | 50 | √ | 0 | 输入码，软件支持在任何地方支持首字母快捷录入功能，<br>输入码调用标量函数F\_getBriefCode获取，推荐提交时动态获取 |  |
| ID\_SevereLevel | int | 4 | √ | 0 | 重症级别表主键 |  |
| ID\_Conclusion | int | 4 | √ | 0 | 字典结论表主键 |  |
| SignContent | varchar | 8000 | √ | 0 | 详细描述模板 |  |
| IS\_State | varchar | 5 | √ | 0 | 0弃用 1启用 新增默认是1 |  |
| IS\_Default | varchar | 5 | √ | 0 | 0或者null为正常体征<br>1为默认体征（往往对应是未见明显异常）一键默认功能 |  |
| DisplayOrder | varchar | 50 | √ | 0 | 排序序号，为了支持中途添加，暂设定为字符串类型，<br>注意：会出现9>10的情况 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 200 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |

**DictExamType 体检类型**

| DictExamType 体检类型 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_ExamType | int | 4 |  | 0 | 体检类型 | √ |
| ExamTypeName | varchar | 50 | √ | 0 | 体检类型名称 |  |
| ID\_Operate | int | 4 | √ | 0 | 修改人ID |  |
| OperateName | varchar | 200 | √ | 0 | 修改人名称 |  |
| OperateTime | varchar | 50 | √ | 0 | 修改时间 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |
| BriefCode | varchar | 255 | √ | 0 | 简码 |  |
| IS\_State | varchar | 2 | √ | 0 | 是否启用 |  |
| DisplayOrder | varchar | 100 | √ | 0 | 排序序号，为了支持中途添加，暂设定为字符串类型，<br>注意：会出现9>10的情况 |  |
| IS\_SysExamType | varchar | 2 | √ | 0 |  |  |

**DictConsumeItem物价字典表**

| DictConsumeItem 物价字典表-不开启物价使用也需要通过sql脚本初始化 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 默认值 | 说明 | 是否主键 |
| ID\_ConsumeItem | int | 4 | 0 | NULL |  | 是 |
| BriefCode | varchar | 200 | 1 | NULL | 首字母拼音简码 |  |
| Name | varchar | 500 | 1 | NULL | 物价名 |  |
| Price | numeric | 9 | 1 | NULL | 单价 |  |
| Unit | varchar | 20 | 1 | NULL | 单位 |  |
| Spec | varchar | 200 | 1 | NULL | 规格 |  |
| Type | varchar | 20 | 1 | NULL | 类型 |  |
| ConsumeItemCode | varchar | 50 | 1 | NULL | 编码 |  |
|  |  |  |  |  |  |  |

**DictFee\_Exam 收费项检查项对应关系表**

| DictFee\_Exam 收费项检查项对应关系表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_Fee\_Exam | int | 4 |  | 0 | 收费项检查项对应关系表主键 | √ |
| ID\_FeeItem | int | 4 | √ | 0 | 收费项字典的主键 |  |
| ID\_ExamItem | int | 4 | √ | 0 | 字典检查项表主键 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 200 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |

**DictFeeItemConsumeItem****收费项物价对应关系表**

| DictFeeItemConsumeItem 收费项物价项对应关系表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 默认值 | 说明 | 是否主键 |
| ID\_FeeItemConsumeItem | int | 4 | 0 | NULL |  |  |
| ID\_FeeItem | int | 4 | 1 | NULL |  |  |
| FeeItemInterfaceCode | varchar | 20 | 1 | NULL | 收费项编码 |  |
| ID\_ConsumeItem | int | 4 | 1 | NULL | 物价id |  |
| ConsumeItemCode | varchar | 20 | 1 | NULL | 物价编码 |  |
| Quantity | float | 8 | 1 | NULL | 数量 |  |
|  |  |  |  |  |  |  |

**DictFeeItem字典收费项表**

| DictFeeItem 字典收费项表3 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_FeeItem | int | 4 |  | 0 | 收费项字典的主键 | √ |
| FeeItemName | varchar | 200 | √ | 0 | 收费项名称 |  |
| BriefCode | varchar | 50 | √ | 0 | 输入码，软件支持在任何地方支持首字母快捷录入功能，<br>输入码调用标量函数F\_getBriefCode获取，推荐提交时动态获取 |  |
| Sex | varchar | 5 | √ | 0 | 性别 0或者null为未录 1男2女3未知(在业务处理里比如vp或rp表3表示未知，<br>在字典业务表里比如ds，dfi等表3表示为男女均可) |  |
| Marriage | varchar | 5 | √ | 0 | 0或者null为未录，1未婚2已婚3未知(在业务处理里比如vp或rp表3表示未知，<br>在字典业务表里比如ds，dfi等表3表示为收费项不关心婚姻) |  |
| Price | numeric | 9 | √ | 2 | 收费项金额 |  |
| ID\_Depart | int | 4 | √ | 0 | 字典科室表主键 |  |
| ID\_SampleType | int | 4 | √ | 0 | 样本类型表主键 |  |
| SampleName | varchar | 50 | √ | 0 | 样本类型名称 |  |
| IS\_Consum | varchar | 5 | √ | 0 | 是否耗材，0和null都是正常收费项，1为耗材，耗材不对应检查项 |  |
| ID\_Guide | int | 4 | √ | 0 | 指引单表主键 |  |
| WarningMsg | varchar | 50 | √ | 0 | 收费项提醒信息，比如尿常规 提示：请留中段尿；女性避开月经期 |  |
| IS\_State | varchar | 5 | √ | 0 | \` 2平台可访问 新增默认是1 |  |
| DisplayOrder | varchar | 50 | √ | 0 | 排序序号，为了支持中途添加，暂设定为字符串类型，注意：会出现9>10的情况 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 200 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |
| InterfaceCode1 | varchar | 255 | √ | 0 | lis对应的检查项编码，需要实施人员现场维护 |  |
| isCheckApply |  |  |  |  | 是否需要检查申请单，null/0-不需要，1-需要 |  |
| applyDemo |  |  |  |  | 检查申请单模板 |  |

**DictFeeItemError 字典收费项错误信息表**

| DictFeeItemError 字典收费项错误信息表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_FeeItem | int | 4 |  | 0 | 收费项字典的主键 | √ |
| FeeItemName | varchar | 200 | √ | 0 | 收费项名称 |  |
| Sex | varchar | 5 | √ | 0 | 性别 0或者null为未录 1男2女3未知(在业务处理里比如vp或rp表3表示未知，<br>在字典业务表里比如ds，dfi等表3表示为男女均可) |  |
| Marriage | varchar | 5 | √ | 0 | 0或者null为未录，1未婚2已婚3未知(在业务处理里比如vp或rp表3表示未知，<br>在字典业务表里比如ds，dfi等表3表示为收费项不关心婚姻) |  |
| Price | numeric | 9 | √ | 2 | 收费项金额 |  |
| ID\_Depart | int | 4 | √ | 0 | 科室ID |  |
| IS\_Consum | varchar | 5 | √ | 0 | 是否耗材，0和null都是正常收费项，1为耗材，耗材不对应检查项 |  |
| IS\_State | varchar | 5 | √ | 0 | 是否启用 |  |
| DisplayOrder | varchar | 50 | √ | 0 | 显示顺序 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |
| ErrorMsg | varchar | 200 | √ | 0 | 错误信息 |  |
| DepartName | varchar | 200 | √ | 0 | 科室名称 |  |
| InterfaceCode1 | varchar | 255 | √ | 0 | lis对应的检查项编码，需要实施人员现场维护 |  |

**DictFeeItemConsumableItem****收费项耗材对应关系表**

| DictFeeItemConsumableItem 收费项耗材对应关系表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 默认值 | 说明 | 是否主键 |
| ID\_FeeItemConsumableItem | int | 4 | 0 | NULL |  | 是 |
| ID\_FeeItem | int | 4 | 1 | NULL | 收费项id |  |
| ID\_ConsumableItem | int | 4 | 1 | NULL | 耗材项id（<br>耗材也存在DictFeeItem表，is\_consum为1就表示耗材<br>） |  |
| Quantity | float | 8 | 1 | NULL | 数量 |  |
|  |  |  |  |  |  |  |

**DictConsumableItemMerge 耗材合并规则表（同一规则内的不合管） 主表**

| DictConsumableItemMerge 耗材合并规则表 主表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 默认值 | 说明 | 是否主键 |
| id\_consumableItem\_merge | int | 4 | 0 | NULL |  | 是 |
| mergeName | varchar | 100 | 1 | NULL | 合并规则名称 |  |
| note | varchar | 200 | 1 | NULL | 备注 |  |
| is\_state | varchar | 5 | 1 | NULL | 状态 1 启用 |  |
| ID\_Operate | int | 4 | 1 | NULL |  |  |
| OperateName | varchar | 200 | 1 | NULL |  |  |
| OperateTime | varchar | 50 | 1 | NULL |  |  |

**DictConsumableItemMergeDetail耗材合并规则项目表（同一规则内的不合管） 子表表**

| DictConsumableItemMergeDetail 耗材合并规则项目表（同一规则内的不合管） 子表表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 默认值 | 说明 | 是否主键 |
| id\_consumableItem\_merge\_detail | int | 4 | 0 | NULL |  | 是 |
| id\_consumableItem\_merge | int | 4 | 1 | NULL | 耗材合不合管规则id |  |
| ID\_FeeItem | int | 4 | 1 | NULL | 收费项id |  |
| feeItemName | varchar | 200 | 1 | NULL | 收费项名称 |  |
|  |  |  |  |  |  |  |

**DictFeeItemConsumableItem****收费项耗材对应关系表**

| DictFeeItemConsumableItem 收费项耗材对应关系表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 默认值 | 说明 | 是否主键 |
| ID\_FeeItemConsumableItem | int | 4 | 0 | NULL |  | 是 |
| ID\_FeeItem | int | 4 | 1 | NULL | 收费项id |  |
| ID\_ConsumableItem | int | 4 | 1 | NULL | 耗材项id（<br>耗材也存在DictFeeItem表，is\_consum为1就表示耗材<br>） |  |
| Quantity | float | 8 | 1 | NULL | 数量 |  |
|  |  |  |  |  |  |  |

**DictFeeItemHalfPrice 半价项目规则表**

| DictFeeItemHalfPrice 半价项目规则表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 默认值 | 说明 | 是否主键 |
| ID\_FeeItemHalfPrice | int | 4 | 0 | NULL |  | 是 |
| ID\_FeeItem | varchar | 50 | 1 | NULL | 收费项id ？ |  |
| FeeItemName | varchar | 50 | 1 | NULL | 收费项名称？ 有明细表这个是不是没有 |  |
| DisplayOrder | varchar | 5 | 1 | NULL | 序号 |  |
| HalfPriceGroup | varchar | 200 | 1 | NULL | 半价分组 |  |
| ID\_Operate | int | 4 | 1 | NULL |  |  |
| OperateName | varchar | 200 | 1 | NULL |  |  |
| OperateTime | varchar | 50 | 1 | NULL |  |  |

**DictFeeItemHalfPriceDetail 半价项目规则明细表**

| DictFeeItemHalfPriceDetail半价项目规则明细表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 默认值 | 说明 | 是否主键 |
| ID\_FeeItemHalfPriceDetail | int | 4 | 0 | NULL |  | 是 |
| ID\_FeeItemHalfPrice | int | 4 | 0 | NULL | 半价规则id |  |
| ID\_FeeItem | int | 4 | 0 | NULL | 收费项id |  |
| DisplayOrder | varchar | 50 | 1 | NULL | 序号 |  |
|  |  |  |  |  |  |  |

**DictGroupType 目前只在开发库中有，不知道用途，表数据为空**

| DictGroupType 目前只在开发库中有，不知道用途，表数据为空 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| GroupTypeName | varchar | 255 | √ | 0 |  |  |
| ID\_Operate | int | 4 | √ | 0 | 打印人id |  |
| OperateName | varchar | 200 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |
| ID\_GroupType | int | 4 |  | 0 |  | √ |
| IS\_State | varchar | 5 | √ | 0 | 是否启用 |  |

**DictGuide 指引单字典表**

| DictGuide 指引单字典表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_Guide | int | 4 |  | 0 | 指引单表主键 | √ |
| GuideName | varchar | 500 | √ | 0 | 指引内容 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 200 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |
| ID\_Depart | int | 4 | √ | 0 | 科室ID |  |

**DictInterface 接口权限控val**

| DictInterface 接口权限控制 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_Interface | int | 4 |  | 0 | 权限控制主键ID | √ |
| InterfaceName | varchar | 200 | √ | 0 | 接口名称 |  |
| ID\_MenuLeaf | int | 4 | √ | 0 | 叶节点的主键 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 200 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |

**DictKeyValue 统一的简单配置表**

| DictKeyValue 统一的简单配置表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_KeyValue | int | 4 |  | 0 | 简单配置表主键 | √ |
| KeyValueName | varchar | 200 | √ | 0 | 配置表名称 |  |
| ValueName | varchar | 500 | √ | 0 | 配置值名称 |  |
| ModularCode | varchar | 100 | √ | 0 | 配置值code |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 200 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |

**DictLabel 标签字典表,总检的人员附加信息时用****IS\_Ocd**

| DictLabel 标签字典表,总检的人员附加信息时用 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_Label | int | 4 |  | 0 | 标签自增主键ID | √ |
| LabelName | varchar | 100 | √ | 0 | 标签名称 |  |
| Type | varchar | 2 | √ | 0 | 类型,0 固定项，1 自定义项 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人ID |  |
| OperateName | varchar | 50 | √ | 0 | 操作人姓名 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |

**DictMenuBranch 软件功能菜单树目录表**

| DictMenuBranch 软件功能菜单树目录表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_MenuBranch | int | 4 |  | 0 | 树目录主键 | √ |
| MenuBranchName | varchar | 200 | √ | 0 | 树目录名称 |  |
| Path | varchar | 50 | √ | 0 | 树路径 |  |
| ID\_MenuRoot | int | 4 | √ | 0 | 根目录主键 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 200 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |
| DisplayOrder | varchar | 10 | √ | 0 | 排序序号，为了支持中途添加，<br>暂设定为字符串类型，注意：会出现9>10的情况 |  |

**DictMenuLeaf 软件功能菜单叶节点表，也是操作节点**

| DictMenuLeaf 软件功能菜单叶节点表，也是操作节点 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_MenuLeaf | int | 4 |  | 0 | 叶节点的主键 | √ |
| MenuLeafName | varchar | 200 | √ | 0 | 叶节点的名称 |  |
| Path | varchar | 50 | √ | 0 | 叶节点路径 |  |
| ReportCode | varchar | 50 | √ | 0 | 自定义报表Code |  |
| ID\_MenuBranch | int | 4 | √ | 0 | 树节点id |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 200 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |
| DisplayOrder | varchar | 10 | √ | 0 | 排序序号，为了支持中途添加，<br>暂设定为字符串类型，注意：会出现9>10的情况 |  |

**DictMenuRoot 软件功能菜单根目录表ile**

| DictMenuRoot 软件功能菜单根目录表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_MenuRoot | int | 4 |  | 0 | 根目录主键 | √ |
| MenuRootName | varchar | 200 | √ | 0 | 根目录名称 |  |
| Path | varchar | 50 | √ | 0 | 路径字段 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 200 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |
| DisplayOrder | varchar | 10 | √ | 0 | 排序序号，为了支持中途添加，暂设定为字符串类型，注意：会出现9>10的情况 |  |

**DictPatientCode 辅助vp表出流水的表**

| DictPatientCode 辅助vp表出流水的表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_PatientCode | int | 4 |  | 0 | 表主键 | √ |
| CurrentDate | varchar | 20 | √ | 0 | 计算的当前日期 |  |
| CurrentIndex | int | 4 | √ | 0 | 当前日期流水最大值 |  |

**DictPatientLevel 人员类型tient**

| DictPatientLevel 人员类型 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_PatientLevel | int | 4 |  | 0 | 人员级别,类别 | √ |
| PatientLevelName | varchar | 200 | √ | 0 | 级别名称,VIP/普通 等 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人 |  |
| OperateName | varchar | 200 | √ | 0 | 操作人 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作人 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |

**DictPayType** 

| DictPayType 表数据为空，不知用途 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_PayType | int | 4 |  | 0 |  | √ |
| PayTypeStr | varchar | 50 | √ | 0 |  |  |
| PayTypeCode | varchar | 50 | √ | 0 |  |  |
| ID\_Operate | int | 4 | √ | 0 | 打印人id |  |
| OperateName | varchar | 50 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 8000 | √ | 0 | 备注 |  |

**DictPerMission 角色权限表**

| DictPerMission 角色权限表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_PerMission | int | 4 |  | 0 | 角色权限表主键 | √ |
| ID\_Role | int | 4 | √ | 0 | 角色表主键 |  |
| ID\_MenuLeaf | int | 4 | √ | 0 | 叶节点表主键 |  |
| ID\_MenuBranch | int | 4 | √ | 0 | 树节点表主键 |  |
| ID\_MenuRoot | int | 4 | √ | 0 | 根节点表主键 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 200 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |

**DictRange 质控表（危急值）**

| DictRange 质控表（危急值） |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_Range | int | 4 |  | 0 | 质控主键ID | √ |
| ID\_ExamItem | int | 4 | √ | 0 | 检查项ID |  |
| RangeFormula | varchar | 8000 | √ | 0 | 质控公式 |  |
| WarningMessage | varchar | 8000 | √ | 0 | 执行质控有值是返回的提示 |  |
| is\_saved | int | 4 | √ | 0 | 是否保存输入值0代表提示不保存，1代表提示并保存 |  |

**DictRole 字典角色表**

| DictRole 字典角色表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_Role | int | 4 |  | 0 | 角色表主键 | √ |
| RoleName | varchar | 200 | √ | 0 | 角色名称 |  |
| Explain | varchar | 500 | √ | 0 | 说明 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 200 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |

| DictRoleDepart 角色与科室关系 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_RoleDepart | int | 4 |  | 0 | 角色与科室对应关系主键ID | √ |
| ID\_Role | int | 4 | √ | 0 | 角色ID |  |
| ID\_Depart | int | 4 | √ | 0 | 科室ID |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人ID |  |
| OperateName | varchar | 200 | √ | 0 | 操作人名称 |  |
| OperateTime | varchar | 50 | √ | 0 | 更改时间 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |

**DictSampleType 字典样本类型表**

| DictSampleType 字典样本类型表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_SampleType | int | 4 |  | 0 | 样本类型表主键 | √ |
| SampleName | varchar | 200 | √ | 0 | 样本类型名称 |  |
| SampleCode | varchar | 50 | √ | 0 | 样本code |  |
| DisplayOrder | varchar | 50 | √ | 0 | 排序序号，为了支持中途添加，<br>暂设定为字符串类型，注意：会出现9>10的情况 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 200 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |
| SampleType | varchar | 50 | √ | 0 |  |  |
| TubeColor | varchar | 50 | √ | 0 |  |  |

**DictSevereLevel 字典重症级别表**

| DictSevereLevel 字典重症级别表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_SevereLevel | int | 4 |  | 0 | 重症级别表主键 | √ |
| SevereLevelName | varchar | 200 | √ | 0 | 重症级别名称 |  |
| DisplayOrder | varchar | 50 | √ | 0 | 排序序号，为了支持中途添加，<br>暂设定为字符串类型，注意：会出现9>10的情况 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 200 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |

**DictSignMutex 体征冲突字典表**

| DictSignMutex 体征冲突字典表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_Mutex | int | 4 |  | 0 | 自增主键ID | √ |
| MutexA | varchar | 50 | √ | 0 | 冲突值A |  |
| MutexB | varchar | 50 | √ | 0 | 冲突值B |  |

**DictSuit 字典套餐表**

| DictSuit 字典套餐表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_Suit | int | 4 |  | 0 | 字典套餐表主键 | √ |
| SuitName | varchar | 200 | √ | 0 | 套餐名称 |  |
| BriefCode | varchar | 50 | √ | 0 | 输入码，软件支持在任何地方支持首字母快捷录入功能，<br>输入码调用标量函数F\_getBriefCode获取，推荐提交时动态获取 |  |
| Sex | varchar | 5 | √ | 0 | 性别 0或者null为未录 1男2女3未知(在业务处理里比如vp或rp表3表示未知，<br>在字典业务表里比如ds，dfi等表3表示为男女均可) |  |
| Marriage | varchar | 5 | √ | 0 | 0或者null为未录，1未婚2已婚3未知(在业务处理里比如vp或rp表3表示未知，<br>在字典业务表里比如ds，dfi等表3表示为收费项不关心婚姻) |  |
| Price | numeric | 9 | √ | 2 | 套餐金额 |  |
| FactPrice | numeric | 9 | √ | 2 | 实际价格 |  |
| IS\_SuitType | varchar | 5 | √ | 0 | 套餐类型，0或者null为套餐，1为组合项 |  |
| ID\_ExamType | int | 4 | √ | 0 | 体检类型（已弃用） |  |
| ExamTypeName | varchar | 50 | √ | 0 | 体检类型名称（已弃用） |  |
| IS\_State | varchar | 5 | √ | 0 | 0弃用 1启用 2平台可访问 新增默认是1 |  |
| DisplayOrder | varchar | 20 | √ | 0 | 排序序号，为了支持中途添加，暂设定为字符串类型，注意：会出现9>10的情况 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 200 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |
| PhysicalTypes | varchar | 50 | √ | 0 | 体检类型代码 |  |
| PhysicalTypeName | varchar | 50 | √ | 0 | 体检类型名称 |  |

**DictSuitDetail 套餐明细表**

| DictSuitDetail 套餐明细表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_SuitDetail | int | 4 |  | 0 | 套餐明细表主键 | √ |
| ID\_Suit | int | 4 | √ | 0 | 字典套餐表主键 |  |
| ID\_FeeItem | int | 4 | √ | 0 | 收费项字典的主键 |  |
| FeeItemName | varchar | 200 | √ | 0 | 收费项名称 |  |
| Price | numeric | 9 | √ | 2 | 收费项金额，必要的冗余字段 |  |
| FactPrice | numeric | 9 | √ | 2 | 收费项实际价格 |  |
| DisplayOrder | varchar | 20 | √ | 0 | 排序序号，为了支持中途添加，暂设定为字符串类型，注意：会出现9>10的情况 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 200 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |

**DictSuitDetailConsumeItem** **套餐明细物价表**

| DictSuitDetailConsumeItem 套餐明细物价表--必须要有 不开启物价导入套餐时也要初始化 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 默认值 | 说明 | 是否主键 |
| ID\_SuitDetailConsumeItem | int | 4 | 0 | NULL |  | 是 |
| ID\_SuitDetail | int | 4 | 1 | NULL | 套餐明细id，用于关联DictSuitDetail |  |
| ID\_ConsumeItem | int | 4 | 1 | NULL | 物价id，用户关联DictConsumeItem表 |  |
| ConsumeItemName | varchar | 100 | 1 | NULL | 物价名称 |  |
| Quantity | float | 8 | 1 | NULL | 数量 |  |
| Price | numeric | 9 | 1 | NULL | 原价 |  |
| Discount | float | 8 | 1 | NULL | 折扣，百分制，7折为70 |  |
| FactPrice | numeric | 9 | 1 | NULL | 折后价 = price\*discount\*quanlity |  |
| ID\_Suit | int | 4 | 1 | NULL | 对应套餐id |  |
| ID\_FeeItem | int | 4 | 1 | NULL | 对应收费项id |  |
|  |  |  |  |  |  |  |

**DictUser 用户表**

| DictUser 用户表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_User | int | 4 |  | 0 | 用户表主键id | √ |
| UserName | varchar | 200 | √ | 0 | 用户名称 |  |
| LoginName | varchar | 200 | √ | 0 | 登陆账号 |  |
| LoginPassword | varchar | 50 | √ | 0 | 账号密码,MD5加密 |  |
| Number | varchar | 50 | √ | 0 | 工号 |  |
| Email | varchar | 200 | √ | 0 | 邮箱 |  |
| ID\_Role | int | 4 | √ | 0 | 角色表主键 |  |
| IS\_Super | varchar | 5 | √ | 0 | 超管 1:超管 其余不是 |  |
| IS\_State | varchar | 5 | √ | 0 | 0弃用 1启用 新增默认是1 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 200 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |

**DictUser\_Role 用户与角色关系**

| DictUser\_Role 用户与角色关系(无用，废弃) |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_User\_Role | int | 4 |  | 0 | 主键ID | √ |
| ID\_User | int | 4 | √ | 0 | 用户ID |  |
| ID\_Role | int | 4 | √ | 0 | 角色ID |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人ID |  |
| OperateName | varchar | 50 | √ | 0 | 操作人名称 |  |
| OperateTime | varchar | 50 | √ | 0 | 更改时间 |  |
| note | varchar | 500 | √ | 0 | 备注 |  |

**DictUserError 用户错误信息表**

| DictUserError 用户错误信息表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_User | int | 4 |  | 0 |  | √ |
| UserName | varchar | 200 | √ | 0 | 用户名称 |  |
| LoginName | varchar | 200 | √ | 0 | 登陆账号 |  |
| LoginPassword | varchar | 50 | √ | 0 | 账号密码 |  |
| Email | varchar | 200 | √ | 0 | 邮箱 |  |
| ID\_Role | int | 4 | √ | 0 | 角色表主键 |  |
| IS\_State | varchar | 5 | √ | 0 | 0弃用 1启用 2平台可访问 新增默认是1 |  |
| IS\_Super | varchar | 5 | √ | 0 | 超管 1:超管 其余不是 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 200 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |

**DictUserFavorites 我的收藏表**

| DictUserFavorites 我的收藏表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_UserFavorites | int | 4 |  | 0 | 我的收藏表主键 | √ |
| ID\_User | int | 4 | √ | 0 | 收藏人id |  |
| ID\_MenuLeaf | int | 4 | √ | 0 | 收藏的叶子节点 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人id |  |
| OperateName | varchar | 200 | √ | 0 | 操作人名称--冗余字段，查询按此查 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 格式为 2020-04-15 09:43:00字符串 |  |
| Note | varchar | 500 | √ | 0 | 备注 |  |

**DictDiagnoseRuleInfo** **智能主检-诊断规则字典表**

| **DictDiagnoseRuleInfo** **智能主检-诊断规则字典表** |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 默认值 | 说明 | 是否主键 |
| IdRule | int | NULL | NO | NULL |  | 是 |
| RuleName | varchar | 255 | YES | NULL | 规则名称 |  |
| ReferDoc | varchar | 255 | YES | NULL | 参考文献 |  |
| CreaterId | int | NULL | YES | NULL | 创建人 |  |
| CreaterName | varchar | 255 | YES | NULL |  |  |
| CreateTime | datetime | NULL | YES | NULL |  |  |
| UpdaterId | int | NULL | YES | NULL |  |  |
| UpdaterName | varchar | 255 | YES | NULL |  |  |
| UpdateTime | datetime | NULL | YES | NULL |  |  |
| RuleStatus | varchar | 255 | YES | NULL | 1启用2未启用 |  |
| RuleOgriginInfo | varchar | MAX | YES | NULL | 规则原始信息json格式 |  |
| RuleRunPath | varchar | MAX | YES | NULL | 规则执行路径的json数组 |  |
| Deleted | int | NULL | YES | ((0)) | 1已删除0未删除 |  |

**DictExamItemQuality 质控-质控规则表nsume**

| **DictExamItemQuality 质控-质控规则表** |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 默认值 | 说明 | 是否主键 |
| ID\_ExamItem\_Quality | int | 4 | 0 | NULL |  | 是 |
| AbnormalType | varchar | 20 | 1 | NULL | 异常类型：<br>A类<br>B类<br>其他异常 |  |
| ID\_Depart | int | 4 | 1 | NULL | 科室id |  |
| ID\_ExamItem | int | 4 | 1 | NULL | 检查项id |  |
| ValueType | varchar | 5 | 1 | NULL | 结果类型，重要字段！1为录入型结果，比如身高体重和检验科回传的数据；<br>2为计算型结果，比如检查项叫血压结论的，或者大小三阳的产生;<br>3 为体征型结果，此检查项不可录入结果，只能通过体征录入结果； |  |
| Sex | varchar | 5 | 1 | NULL | 性别，1男 2女 3未知 |  |
| Marriage | varchar | 5 | 1 | NULL | 婚姻  1未婚 2已婚 3不限 |  |
| Unit | varchar | 10 | 1 | NULL | 单位 |  |
| MinAge | int | 4 | 1 | NULL | 最小年龄 |  |
| MaxAge | int | 4 | 1 | NULL | 最大年龄 |  |
| IS\_State | int | 4 | 1 | NULL | 状态  1启用 0禁用 |  |
| ID\_Operate | int | 4 | 1 | NULL |  |  |
| OperateName | varchar | 20 | 1 | NULL |  |  |
| OperateTime | varchar | 50 | 1 | NULL |  |  |
| ConditionExpression | varchar | 1500 | 1 | NULL | 质控表达式， |  |
| ConditionShow | varchar | 1000 | 1 | NULL | 对应结论 |  |
| note | varchar | 500 | 1 | NULL | 备注 |  |

**DictExamItemQualityCondition质控-质控规则子表-条件表**

| **DictExamItemQualityCondition质控-质控规则子表-条件表** |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 默认值 | 说明 | 是否主键 |
| ID\_ExamItem\_Quality\_Condition | int | 4 | 0 | NULL |  | 是 |
| ID\_ExamItem\_Quality | int | 4 | 1 | NULL | 质控规则id |  |
| LeftParenthesis | varchar | 20 | 1 | NULL | 左括号 |  |
| ID\_ExamItem | int | 4 | 1 | NULL | 检查项id，比如 血压 |  |
| ConditionFlag | varchar | 20 | 1 | NULL | 条件操作符， 比如（> ,>=<br>,like） |  |
| ConditionValue | varchar | 100 | 1 | NULL | 条件比较值，比如 180 |  |
| RightParenthesis | varchar | 20 | 1 | NULL | 右括号 |  |
| RelevanceFlag | varchar | 20 | 1 | NULL | 关联符 or 或则 and |  |
| ID\_Depart | int | 4 | 1 | NULL | 科室id |  |
| ConditionType | int | 4 | 1 | NULL | 条件类型：1：检查结果；2：标识符 |  |
|  |  |  |  |  |  |  |

**DictConclusionFormula 诊断库-诊断公式**

| **DictConclusionFormula 诊断库-诊断公式** |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 默认值 | 说明 | 是否主键 |
| ID\_Conclusion\_Formula | int | 4 | 0 | NULL |  | 是 |
| FormulaName | varchar | 200 | 1 | NULL | 公式名称 |  |
| ID\_Conclusion | int | 4 | 1 | NULL | 结论id |  |
| ConclusionName | varchar | 2000 | 1 | NULL | 结论名 |  |
| Sex | varchar | 5 | 1 | NULL | 性别 |  |
| Marriage | varchar | 5 | 1 | NULL | 婚姻 |  |
| MinAge | int | 4 | 1 | NULL | 最新年龄 |  |
| MaxAge | int | 4 | 1 | NULL | 最大年龄 |  |
| ID\_Departs | varchar | 100 | 1 | NULL | 所属科室，英文逗号拼接 |  |
| DepartNames | varchar | 500 | 1 | NULL | 科室名称，英文逗号拼接 |  |
| IS\_Summary | int | 4 | 1 | NULL | 是否用于小结 1是 0否 |  |
| IS\_State | varchar | 5 | 1 | NULL | 是否启用 1启用 0禁用 |  |
| ConditionExpression | varchar | \-1 | 1 | NULL | 诊断表达式 |  |
| ConditionShow | varchar | 4000 | 1 | NULL | 诊断表达式中文展示 |  |
| ID\_Create | int | 4 | 1 | NULL | 创建人id |  |
| CreateName | varchar | 200 | 1 | NULL | 创建人 |  |
| CreateTime | varchar | 50 | 1 | NULL | 创建时间 |  |
| ID\_Operate | int | 4 | 1 | NULL |  |  |
| OperateName | varchar | 200 | 1 | NULL |  |  |
| OperateTime | varchar | 50 | 1 | NULL |  |  |
| BriefCode | varchar | 50 | 1 | NULL | 公式名称简码 |  |

**DictConclusionFormulaCondition 诊断库-诊断公式-条件表**

| **DictConclusionFormulaCondition 诊断库-诊断公式-条件表** |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 默认值 | 说明 | 是否主键 |
| ID\_Conclusion\_Formula\_Condition | int | 4 | 0 | NULL |  | 是 |
| ID\_Conclusion\_Formula | int | 4 | 1 | NULL | 诊断公式id 关联诊断公式表 |  |
| LeftParenthesis | varchar | 20 | 1 | NULL | 左括号 |  |
| ID\_ExamItem | int | 4 | 1 | NULL | 检查项id，比如 血压 |  |
| ConditionFlag | varchar | 20 | 1 | NULL | 条件操作符， 比如（> ,>=<br>,like） |  |
| ConditionValue | varchar | 100 | 1 | NULL | 条件比较值，比如 180 |  |
| RightParenthesis | varchar | 20 | 1 | NULL | 又括号 |  |
| RelevanceFlag | varchar | 20 | 1 | NULL | 关联符 or 或则 and |  |
| ID\_Depart | int | 4 | 1 | NULL | 科室id |  |
| ConditionType | int | 4 | 1 | NULL | 条件类型：1：检查结果；2：标识符。对应conditionValue指的是检查项的value还是lisTag |  |
|  |  |  |  |  |  |  |

**DictCard 电子卡主表**

| **DictCard 电子卡表** |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 默认值 | 说明 | 是否主键 |
| ID\_Card | int | 4 |  |  |  | 是 |
| CardNo | varchar | 100 | √ |  | 卡号 |  |
| Type | varchar | 5 | √ |  | 卡类型：<br>_1 储值卡 2一次性电子消费卡_ |  |
| Amount | numeric | 9 | √ |  | 卡金额,单位元 |  |
| Balance | numeric | 9 | √ |  | 卡剩余金额，单位元 |  |
| IdentityCard | varchar | 20 | √ |  | 持卡人证件号 |  |
| CardType | varchar | 5 | √ |  | 持卡人证件类型 |  |
| PatientName | varchar | 50 | √ |  | 持卡人 |  |
| Sex | varchar | 5 | √ |  | 持卡人性别：<br>_1男 2女 3未知_ |  |
| Phone | varchar | 20 | √ |  | 持卡人电话 |  |
| UseLimit | varchar | 5 | √ |  | 是否限制本人使用：<br>1 是 0 否 |  |
| ExpireAt | varchar | 20 | √ |  | 电子卡过期时间 |  |
| ID\_Org | int | 4 | √ |  |  |  |
| OrgName | varchar | 50 | √ |  |  |  |
| Note | varchar | 500 | √ |  | 办卡备注 |  |
| LockId | int | 4 | √ |  | 电子卡锁定人idPatient：<br>如果被锁定，一次性卡当前不可用 |  |
| LockedBalance | numeric | 9 | √ | ((0)) | 锁定金额,被锁定金额不可用。比如余额balance=200,锁定金额50，那只剩150可用 |  |
| State | varchar | 5 | √ | ((1)) | 卡状态：<br>_1有效  2 已用 （一次性卡消费过了就是已用，储值卡有效期余额为0还是有效） 3 失效  10注销_ |  |
| ID\_Create | int | 4 | √ |  | 电子卡创建id |  |
| CreateName | varchar | 50 | √ |  | 电子卡创建人姓名 |  |
| CreateTime | varchar | 20 | √ |  | 电子卡创建时间 |  |
| ID\_Operate | int | 4 | √ |  | 操作人id |  |
| OperateName | varchar | 50 | √ |  | 操作姓名 |  |
| OperateTime | varchar | 20 | √ |  | 操作时间 |  |
| Pic | image | 16 | √ |  | 持卡人照片 |  |
| Source | int | 4 | √ | ((1)) | _办卡来源， 1 人工办卡 2 团检限额办卡 3福利转赠_<br>4 亲属检 |  |
| CardNoRule | int | 4 | √ |  | 卡号创建规则 |  |

**DictCardRecord 电子卡消费记录表**

| **DictCardRecord 电子卡消费记录表** |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 默认值 | 字段说明 |
| ID\_CardRecord | int | 4 |  |  |  |
| ID\_Card | int | 4 | √ |  | 电子卡id |
| Note | varchar | 500 | √ |  | 流水备注 |
| Amount | numeric | 9 | √ |  | 充值金额，单位元 |
| Balance | numeric | 9 | √ |  | 充值后电子卡余额，单位元 |
| OrderNo | varchar | 50 | √ |  | 交易流水号 |
| ID\_Create | int | 4 | √ |  | 交易人id |
| CreateName | varchar | 50 | √ |  | 交易人姓名 |
| CreateTime | varchar | 20 | √ |  | 交易时间 |
| type | int | 4 | √ |  | 1充值2消费 |
| Source | int | 4 | √ | ((1)) | 充值来源：<br>_1 人工充值 2 团检限额充值 3 亲属检转赠_ |
| PatientName | varchar | 1000 | √ |  | 消费人 |
| Sex | varchar | 5 | √ |  | 消费人性别 |
| Phone | varchar | 20 | √ |  | 消费人电话 |
| CardType | varchar | 5 | √ |  | 消费人证件类型，同vp |
| IdentityCard | varchar | 20 | √ |  | 消费人证件号 |
| ID\_Patient | varchar | 20 | √ |  | 消费人体检id |

**DictSecretGrade密级管理表**

| **DictSecretGrade密级管理表** |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 默认值 | 字段说明 |
| ID\_SecretGrade | int | 4 |  |  |  |
| CustomerType | varchar | 5 | √ |  | 客户类型 |
| Is\_IdCard | varchar | 5 |  |  | 加密范围：身份证 <br>是：1，否0 |
| Is\_Name | varchar | 5 |  |  | 加密范围：姓名 <br>是：1，否0 |
| Is\_Phone | varchar | 5 |  |  | 加密范围：手机号<br>是：1，否0 |
| Auth\_UserId | varchar | 200 |  |  | 授权用户id，如果不填，则加密规则无效 |
| create\_time | varchar | 20 |  |  |  |
| update\_time | varchar | 20 |  |  |  |