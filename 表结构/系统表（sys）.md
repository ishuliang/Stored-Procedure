# 系统表（sys）

| sys\_code\_type 系统代码表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| sys\_code\_type\_id | int | 4 |  | 0 |  | √ |
| type\_code | varchar | 255 | √ | 0 | 类别编码 |  |
| type\_name | varchar | 255 | √ | 0 | 类别名称 |  |
| display\_order | varchar | 255 | √ | 0 | 排序序号，为了支持中途添加，暂设定为字符串类型，注意：会出现9>10的情况 |  |
| briefcode | varchar | 255 | √ | 0 | 简码 |  |
| is\_state | varchar | 5 | √ | 0 | 是否启用 |  |
| type\_level | int | 4 | √ | 0 | 级别 |  |
| business\_level | varchar | 50 | √ | 0 |  |  |
| parent\_type\_code | varchar | 255 | √ | 0 | 父节点编码 |  |
| id\_operate | int | 4 | √ | 0 | 打印人id |  |
| operate\_name | varchar | 255 | √ | 0 | 姓名 |  |
| operate\_time | varchar | 255 | √ | 0 | 操作时间 |  |

| SysColumnLog 操作日志表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_Sys\_Column\_Log | int | 4 |  | 0 |  | √ |
| Table\_Name | varchar | 50 |  | 0 | 表名 |  |
| Column\_Name | varchar | 50 |  | 0 | 列名 |  |
| ID\_Column | int | 4 |  | 0 | 数据主键ID | √ |
| Old\_Value | varchar | 200 |  | 0 | 旧值 |  |
| New\_Value | varchar | 200 |  | 0 | 新值 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人ID |  |
| OperateName | varchar | 50 | √ | 0 | 操作人姓名 |  |
| OperateTime | varchar | 50 | √ | 0 | 操作时间 |  |

| SysConfig 系统配置表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_Config | int | 4 |  | 0 |  | √ |
| ConfigName | varchar | 100 | √ | 0 | 参数名 |  |
| ConfigKey | varchar | 100 | √ | 0 | 参数关键字 |  |
| ConfigValue | varchar | 255 | √ | 0 | 参数值 |  |
| Note | varchar | 255 | √ | 0 | 备注 |  |
| CreateBy | varchar | 255 | √ | 0 | 创建人 |  |
| GmtCreate | varchar | 255 | √ | 0 | 创建时间 |  |
| UpdateBy | varchar | 255 | √ | 0 | 更新人 |  |
| GmtUpdate | varchar | 255 | √ | 0 | 创建人 |  |

| SysImgConfig 当前机构设置 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_Config | int | 4 |  | 0 |  | √ |
| ConfigName | varchar | 100 | √ | 0 | 机构名称 |  |
| ConfigKey | varchar | 100 | √ | 0 | logo |  |
| ConfigType | int | 4 | √ | 0 | 类型 |  |
| ConfigValue | image | 16 | √ | 0 | 图片 |  |
| Note | varchar | 255 | √ | 0 | 备注 |  |
| CreateBy | varchar | 255 | √ | 0 | 创建人 |  |
| GmtCreate | varchar | 255 | √ | 0 | 创建时间 |  |
| UpdateBy | varchar | 255 | √ | 0 | 更新人 |  |
| GmtUpdate | varchar | 255 | √ | 0 | 更新时间 |  |

| SysMenu 菜单表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_Menu | bigint | 8 |  | 0 | 菜单ID | √ |
| MenuName | varchar | 50 | √ | 0 | 菜单名称 |  |
| ID\_Parent | bigint | 8 | √ | 0 | 父菜单ID |  |
| DisplayOrder | varchar | 50 | √ | 0 | 显示顺序 |  |
| Path | varchar | 255 | √ | 0 | 路由地址 |  |
| Component | varchar | 255 | √ | 0 | 组件路径 |  |
| MenuType | varchar | 1 | √ | 0 | 菜单类型（TM目录 M目录 C菜单 F按钮） |  |
| IS\_State | varchar | 1 | √ | 0 | 是否启用 |  |
| Perms | varchar | 500 | √ | 0 | 权限标识 |  |
| Icon | varchar | 100 | √ | 0 | 菜单图标 |  |
| ReportCode | varchar | 255 | √ | 0 | 报表code |  |
| IS\_Report | varchar | 1 | √ | 0 | 1报表菜单，0其他菜单 |  |
| CreateBy | varchar | 255 | √ | 0 | 创建者 |  |
| GmtCreate | varchar | 255 | √ | 0 | 创建时间 |  |
| UpdateBy | varchar | 255 | √ | 0 | 更新者 |  |
| GmtModified | varchar | 255 | √ | 0 | 更新时间 |  |
| Remark | varchar | 255 | √ | 0 | 备注 |  |
| IS\_Outlink | varchar | 1 | √ | 0 |  |  |
| Outlink | varchar | 255 | √ | 0 |  |  |

| SysOperLog 操作日志记录表 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_Oper | int | 4 |  | 0 | 操作日志自增ID | √ |
| Title | varchar | 255 | √ | 0 | 操作的模块,预约等 |  |
| BusinessType | varchar | 255 | √ | 0 | 操作类型 |  |
| Method | varchar | 255 | √ | 0 | 操作的方法 |  |
| RequestMethod | varchar | 255 | √ | 0 | 请求方式 |  |
| ID\_Operate | int | 4 | √ | 0 | 操作人ID |  |
| OperateName | varchar | 255 | √ | 0 | 操作人姓名 |  |
| OperUrl | varchar | 255 | √ | 0 | 请求地址 |  |
| OperIp | varchar | 255 | √ | 0 | 请求IP |  |
| OperLocation | varchar | 255 | √ | 0 | 中文释义, 访问的地里位置 |  |
| OperParam | varchar | 8000 | √ | 0 | 入参 |  |
| JsonResult | varchar | 8000 | √ | 0 | 成功时的返回值 |  |
| Status | varchar | 50 | √ | 0 | Success/fall |  |
| ErrorMsg | varchar | 8000 | √ | 0 | 错误消息 |  |
| OperateTime | varchar | 20 | √ | 0 | 操作时间 |  |

| SysRole\_Menu 角色权限菜单 |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| 字段名 | 字段类型 | 字段长度 | 是否可以为空 | 精确位 | 说明 | 是否主键 |
| ID\_Role\_Menu | bigint | 8 |  | 0 |  | √ |
| ID\_Role | int | 4 | √ | 0 | 角色表主键 |  |
| ID\_Menu | bigint | 8 | √ | 0 |  |  |
| CreateBy | varchar | 255 | √ | 0 | 创建人 |  |
| GmtCreate | varchar | 255 | √ | 0 |  |  |
| UpdateBy | varchar | 255 | √ | 0 |  |  |
| GmtModified | varchar | 255 | √ | 0 |  |  |