/*
MySQL Backup
Database: fun_base
Version: 5.7
Backup Time: 2019-12-06 23:41:51
*/

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `fun_base`.`gen_table`;
DROP TABLE IF EXISTS `fun_base`.`gen_table_column`;
DROP TABLE IF EXISTS `fun_base`.`qrtz_blob_triggers`;
DROP TABLE IF EXISTS `fun_base`.`qrtz_calendars`;
DROP TABLE IF EXISTS `fun_base`.`qrtz_cron_triggers`;
DROP TABLE IF EXISTS `fun_base`.`qrtz_fired_triggers`;
DROP TABLE IF EXISTS `fun_base`.`qrtz_job_details`;
DROP TABLE IF EXISTS `fun_base`.`qrtz_locks`;
DROP TABLE IF EXISTS `fun_base`.`qrtz_paused_trigger_grps`;
DROP TABLE IF EXISTS `fun_base`.`qrtz_scheduler_state`;
DROP TABLE IF EXISTS `fun_base`.`qrtz_simple_triggers`;
DROP TABLE IF EXISTS `fun_base`.`qrtz_simprop_triggers`;
DROP TABLE IF EXISTS `fun_base`.`qrtz_triggers`;
DROP TABLE IF EXISTS `fun_base`.`sys_config`;
DROP TABLE IF EXISTS `fun_base`.`sys_dept`;
DROP TABLE IF EXISTS `fun_base`.`sys_dict_data`;
DROP TABLE IF EXISTS `fun_base`.`sys_dict_type`;
DROP TABLE IF EXISTS `fun_base`.`sys_job`;
DROP TABLE IF EXISTS `fun_base`.`sys_job_log`;
DROP TABLE IF EXISTS `fun_base`.`sys_login_log`;
DROP TABLE IF EXISTS `fun_base`.`sys_menu`;
DROP TABLE IF EXISTS `fun_base`.`sys_notice`;
DROP TABLE IF EXISTS `fun_base`.`sys_oper_log`;
DROP TABLE IF EXISTS `fun_base`.`sys_post`;
DROP TABLE IF EXISTS `fun_base`.`sys_role`;
DROP TABLE IF EXISTS `fun_base`.`sys_role_dept`;
DROP TABLE IF EXISTS `fun_base`.`sys_role_menu`;
DROP TABLE IF EXISTS `fun_base`.`sys_user`;
DROP TABLE IF EXISTS `fun_base`.`sys_user_post`;
DROP TABLE IF EXISTS `fun_base`.`sys_user_role`;
DROP TABLE IF EXISTS `fun_base`.`ums_permission`;
DROP TABLE IF EXISTS `fun_base`.`ums_role`;
DROP TABLE IF EXISTS `fun_base`.`ums_role_perm`;
DROP TABLE IF EXISTS `fun_base`.`ums_user`;
DROP TABLE IF EXISTS `fun_base`.`ums_user_role`;
CREATE TABLE `gen_table`
(
    `table_id`        bigint(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
    `table_name`      varchar(200)  DEFAULT '' COMMENT '表名称',
    `table_comment`   varchar(500)  DEFAULT '' COMMENT '表描述',
    `class_name`      varchar(100)  DEFAULT '' COMMENT '实体类名称',
    `tpl_category`    varchar(200)  DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
    `package_name`    varchar(100)  DEFAULT NULL COMMENT '生成包路径',
    `module_name`     varchar(30)   DEFAULT NULL COMMENT '生成模块名',
    `business_name`   varchar(30)   DEFAULT NULL COMMENT '生成业务名',
    `function_name`   varchar(50)   DEFAULT NULL COMMENT '生成功能名',
    `function_author` varchar(50)   DEFAULT NULL COMMENT '生成功能作者',
    `options`         varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
    `create_by`       varchar(64)   DEFAULT '' COMMENT '创建者',
    `create_time`     datetime      DEFAULT NULL COMMENT '创建时间',
    `update_by`       varchar(64)   DEFAULT '' COMMENT '更新者',
    `update_time`     datetime      DEFAULT NULL COMMENT '更新时间',
    `remark`          varchar(500)  DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 27
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='代码生成业务表';
CREATE TABLE `gen_table_column`
(
    `column_id`      bigint(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
    `table_id`       varchar(64)  DEFAULT NULL COMMENT '归属表编号',
    `column_name`    varchar(200) DEFAULT NULL COMMENT '列名称',
    `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
    `column_type`    varchar(100) DEFAULT NULL COMMENT '列类型',
    `java_type`      varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
    `java_field`     varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
    `is_pk`          char(1)      DEFAULT NULL COMMENT '是否主键（1是）',
    `is_increment`   char(1)      DEFAULT NULL COMMENT '是否自增（1是）',
    `is_required`    char(1)      DEFAULT NULL COMMENT '是否必填（1是）',
    `is_insert`      char(1)      DEFAULT NULL COMMENT '是否为插入字段（1是）',
    `is_edit`        char(1)      DEFAULT NULL COMMENT '是否编辑字段（1是）',
    `is_list`        char(1)      DEFAULT NULL COMMENT '是否列表字段（1是）',
    `is_query`       char(1)      DEFAULT NULL COMMENT '是否查询字段（1是）',
    `query_type`     varchar(200) DEFAULT '=' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
    `html_type`      varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
    `dict_type`      varchar(200) DEFAULT '' COMMENT '字典类型',
    `sort`           int(11)      DEFAULT NULL COMMENT '排序',
    `create_by`      varchar(64)  DEFAULT '' COMMENT '创建者',
    `create_time`    datetime     DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(64)  DEFAULT '' COMMENT '更新者',
    `update_time`    datetime     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 286
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='代码生成业务表字段';

CREATE TABLE `qrtz_blob_triggers`
(
    `sched_name`    varchar(120) NOT NULL,
    `trigger_name`  varchar(200) NOT NULL,
    `trigger_group` varchar(200) NOT NULL,
    `blob_data`     blob,
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC;
CREATE TABLE `qrtz_calendars`
(
    `sched_name`    varchar(120) NOT NULL,
    `calendar_name` varchar(200) NOT NULL,
    `calendar`      blob         NOT NULL,
    PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC;
CREATE TABLE `qrtz_cron_triggers`
(
    `sched_name`      varchar(120) NOT NULL,
    `trigger_name`    varchar(200) NOT NULL,
    `trigger_group`   varchar(200) NOT NULL,
    `cron_expression` varchar(200) NOT NULL,
    `time_zone_id`    varchar(80) DEFAULT NULL,
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    KEY `qrtz_cron_triggers_ibfk_1` (`sched_name`, `trigger_group`),
    CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_group`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC;
CREATE TABLE `qrtz_fired_triggers`
(
    `sched_name`        varchar(120) NOT NULL,
    `entry_id`          varchar(95)  NOT NULL,
    `trigger_name`      varchar(200) NOT NULL,
    `trigger_group`     varchar(200) NOT NULL,
    `instance_name`     varchar(200) NOT NULL,
    `fired_time`        bigint(13)   NOT NULL,
    `sched_time`        bigint(13)   NOT NULL,
    `priority`          int(11)      NOT NULL,
    `state`             varchar(16)  NOT NULL,
    `job_name`          varchar(200) DEFAULT NULL,
    `job_group`         varchar(200) DEFAULT NULL,
    `is_nonconcurrent`  varchar(1)   DEFAULT NULL,
    `requests_recovery` varchar(1)   DEFAULT NULL,
    PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC;
CREATE TABLE `qrtz_job_details`
(
    `sched_name`        varchar(120) NOT NULL,
    `job_name`          varchar(200) NOT NULL,
    `job_group`         varchar(200) NOT NULL,
    `description`       varchar(250) DEFAULT NULL,
    `job_class_name`    varchar(250) NOT NULL,
    `is_durable`        varchar(1)   NOT NULL,
    `is_nonconcurrent`  varchar(1)   NOT NULL,
    `is_update_data`    varchar(1)   NOT NULL,
    `requests_recovery` varchar(1)   NOT NULL,
    `job_data`          blob,
    PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC;
CREATE TABLE `qrtz_locks`
(
    `sched_name` varchar(120) NOT NULL,
    `lock_name`  varchar(40)  NOT NULL,
    PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC;
CREATE TABLE `qrtz_paused_trigger_grps`
(
    `sched_name`    varchar(120) NOT NULL,
    `trigger_group` varchar(200) NOT NULL,
    PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC;
CREATE TABLE `qrtz_scheduler_state`
(
    `sched_name`        varchar(120) NOT NULL,
    `instance_name`     varchar(200) NOT NULL,
    `last_checkin_time` bigint(13)   NOT NULL,
    `checkin_interval`  bigint(13)   NOT NULL,
    PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC;
CREATE TABLE `qrtz_simple_triggers`
(
    `sched_name`      varchar(120) NOT NULL,
    `trigger_name`    varchar(200) NOT NULL,
    `trigger_group`   varchar(200) NOT NULL,
    `repeat_count`    bigint(7)    NOT NULL,
    `repeat_interval` bigint(12)   NOT NULL,
    `times_triggered` bigint(10)   NOT NULL,
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC;
CREATE TABLE `qrtz_simprop_triggers`
(
    `sched_name`    varchar(120) NOT NULL,
    `trigger_name`  varchar(200) NOT NULL,
    `trigger_group` varchar(200) NOT NULL,
    `str_prop_1`    varchar(512)   DEFAULT NULL,
    `str_prop_2`    varchar(512)   DEFAULT NULL,
    `str_prop_3`    varchar(512)   DEFAULT NULL,
    `int_prop_1`    int(11)        DEFAULT NULL,
    `int_prop_2`    int(11)        DEFAULT NULL,
    `long_prop_1`   bigint(20)     DEFAULT NULL,
    `long_prop_2`   bigint(20)     DEFAULT NULL,
    `dec_prop_1`    decimal(13, 4) DEFAULT NULL,
    `dec_prop_2`    decimal(13, 4) DEFAULT NULL,
    `bool_prop_1`   varchar(1)     DEFAULT NULL,
    `bool_prop_2`   varchar(1)     DEFAULT NULL,
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC;
CREATE TABLE `qrtz_triggers`
(
    `sched_name`     varchar(120) NOT NULL,
    `trigger_name`   varchar(200) NOT NULL,
    `trigger_group`  varchar(200) NOT NULL,
    `job_name`       varchar(200) NOT NULL,
    `job_group`      varchar(200) NOT NULL,
    `description`    varchar(250) DEFAULT NULL,
    `next_fire_time` bigint(13)   DEFAULT NULL,
    `prev_fire_time` bigint(13)   DEFAULT NULL,
    `priority`       int(11)      DEFAULT NULL,
    `trigger_state`  varchar(16)  NOT NULL,
    `trigger_type`   varchar(8)   NOT NULL,
    `start_time`     bigint(13)   NOT NULL,
    `end_time`       bigint(13)   DEFAULT NULL,
    `calendar_name`  varchar(200) DEFAULT NULL,
    `misfire_instr`  smallint(2)  DEFAULT NULL,
    `job_data`       blob,
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    KEY `sched_name` (`sched_name`, `job_name`, `job_group`) USING BTREE,
    KEY `sched_name_2` (`sched_name`, `trigger_group`),
    CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC;
CREATE TABLE `sys_config`
(
    `config_id`    int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
    `config_name`  varchar(100) DEFAULT '' COMMENT '参数名称',
    `config_key`   varchar(100) DEFAULT '' COMMENT '参数键名',
    `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
    `config_type`  char(1)      DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
    `create_by`    varchar(64)  DEFAULT '' COMMENT '创建者',
    `create_time`  bigint(15)   DEFAULT NULL COMMENT '创建时间',
    `update_by`    varchar(64)  DEFAULT '' COMMENT '更新者',
    `update_time`  bigint(15)   DEFAULT NULL COMMENT '更新时间',
    `remark`       varchar(500) DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='参数配置表';
CREATE TABLE `sys_dept`
(
    `dept_id`     bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
    `parent_id`   bigint(20)  DEFAULT '0' COMMENT '父部门id',
    `ancestors`   varchar(50) DEFAULT '' COMMENT '祖级列表',
    `dept_name`   varchar(30) DEFAULT '' COMMENT '部门名称',
    `order_num`   int(4)      DEFAULT '0' COMMENT '显示顺序',
    `leader`      varchar(20) DEFAULT NULL COMMENT '负责人',
    `phone`       varchar(11) DEFAULT NULL COMMENT '联系电话',
    `email`       varchar(50) DEFAULT NULL COMMENT '邮箱',
    `status`      char(1)     DEFAULT '1' COMMENT '部门状态（0禁用 1正常）',
    `del_flag`    char(1)     DEFAULT '1' COMMENT '删除标志（1代表存在 2代表删除）',
    `create_by`   varchar(64) DEFAULT '' COMMENT '创建者',
    `create_time` bigint(15)  DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) DEFAULT '' COMMENT '更新者',
    `update_time` bigint(15)  DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 110
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='部门表';
CREATE TABLE `sys_dict_data`
(
    `dict_code`   bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
    `dict_sort`   int(4)       DEFAULT '0' COMMENT '字典排序',
    `dict_label`  varchar(100) DEFAULT '' COMMENT '字典标签',
    `dict_value`  varchar(100) DEFAULT '' COMMENT '字典键值',
    `dict_type`   varchar(100) DEFAULT '' COMMENT '字典类型',
    `css_class`   varchar(100) DEFAULT '' COMMENT '样式属性（其他样式扩展）',
    `list_class`  varchar(100) DEFAULT NULL COMMENT '表格回显样式',
    `is_default`  char(1)      DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
    `status`      char(1)      DEFAULT '1' COMMENT '状态（0禁用 1正常）',
    `create_by`   varchar(64)  DEFAULT '' COMMENT '创建者',
    `create_time` bigint(15)   DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64)  DEFAULT '' COMMENT '更新者',
    `update_time` bigint(15)   DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 35
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='字典数据表';
CREATE TABLE `sys_dict_type`
(
    `dict_id`     bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
    `dict_name`   varchar(100) DEFAULT '' COMMENT '字典名称',
    `dict_type`   varchar(100) DEFAULT '' COMMENT '字典类型',
    `status`      char(1)      DEFAULT '1' COMMENT '状态（0禁用 1正常）',
    `create_by`   varchar(64)  DEFAULT '' COMMENT '创建者',
    `create_time` bigint(15)   DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64)  DEFAULT '' COMMENT '更新者',
    `update_time` bigint(15)   DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`dict_id`) USING BTREE,
    UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 11
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='字典类型表';
CREATE TABLE `sys_job`
(
    `job_id`          bigint(20)   NOT NULL AUTO_INCREMENT COMMENT '任务ID',
    `job_name`        varchar(64)  NOT NULL DEFAULT '' COMMENT '任务名称',
    `job_group`       varchar(64)  NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
    `invoke_target`   varchar(500) NOT NULL COMMENT '调用目标字符串',
    `cron_expression` varchar(255)          DEFAULT '' COMMENT 'cron执行表达式',
    `misfire_policy`  varchar(20)           DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
    `concurrent`      char(1)               DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
    `status`          char(1)               DEFAULT '1' COMMENT '状态（1正常 0暂停）',
    `create_by`       varchar(64)           DEFAULT '' COMMENT '创建者',
    `create_time`     bigint(13)            DEFAULT NULL COMMENT '创建时间',
    `update_by`       varchar(64)           DEFAULT '' COMMENT '更新者',
    `update_time`     bigint(15)            DEFAULT NULL COMMENT '更新时间',
    `remark`          varchar(500)          DEFAULT '' COMMENT '备注信息',
    PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='定时任务调度表';
CREATE TABLE `sys_job_log`
(
    `job_log_id`     bigint(20)   NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
    `job_name`       varchar(64)  NOT NULL COMMENT '任务名称',
    `job_group`      varchar(64)  NOT NULL COMMENT '任务组名',
    `invoke_target`  varchar(500) NOT NULL COMMENT '调用目标字符串',
    `job_message`    varchar(500)  DEFAULT NULL COMMENT '日志信息',
    `status`         char(1)       DEFAULT '1' COMMENT '执行状态（1正常 0失败）',
    `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
    `create_time`    bigint(15)    DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='定时任务调度日志表';
CREATE TABLE `sys_login_log`
(
    `info_id`        bigint(20) NOT NULL AUTO_INCREMENT,
    `login_name`     varchar(25)  DEFAULT NULL COMMENT '登录账号',
    `login_location` varchar(100) DEFAULT NULL COMMENT '登录地点',
    `ipaddr`         varchar(50)  DEFAULT NULL COMMENT 'ip地址',
    `os`             varchar(50)  DEFAULT NULL COMMENT '操作系统',
    `browser`        varchar(50)  DEFAULT NULL COMMENT '浏览器',
    `msg`            varchar(255) DEFAULT NULL,
    `create_time`    bigint(15)   DEFAULT NULL COMMENT '访问时间',
    `status`         char(1)      DEFAULT '0' COMMENT '0-成功1-失败',
    PRIMARY KEY (`info_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 211
  DEFAULT CHARSET = utf8mb4 COMMENT ='登录日志';
CREATE TABLE `sys_menu`
(
    `menu_id`     int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
    `menu_name`   varchar(40)                     DEFAULT NULL COMMENT '菜单名称',
    `parent_id`   int(11)                         DEFAULT '0' COMMENT '父菜单ID',
    `order_num`   int(4)                          DEFAULT NULL COMMENT '显示顺序',
    `url`         varchar(200)                    DEFAULT '#' COMMENT '请求地址',
    `target`      varchar(20) CHARACTER SET utf8  DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
    `menu_type`   char(1) CHARACTER SET utf8      DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
    `visible`     char(1) CHARACTER SET utf8      DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
    `perms`       varchar(100) CHARACTER SET utf8 DEFAULT '' COMMENT '权限标识',
    `icon`        varchar(100) CHARACTER SET utf8 DEFAULT '#' COMMENT '菜单图标',
    `create_by`   varchar(30) CHARACTER SET utf8  DEFAULT '' COMMENT '创建者',
    `create_time` bigint(13)                      DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(30) CHARACTER SET utf8  DEFAULT '' COMMENT '更新者',
    `update_time` bigint(13)                      DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`menu_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 103
  DEFAULT CHARSET = utf8mb4;
CREATE TABLE `sys_notice`
(
    `notice_id`      int(4)      NOT NULL AUTO_INCREMENT COMMENT '公告ID',
    `notice_title`   varchar(50) NOT NULL COMMENT '公告标题',
    `notice_type`    char(1)     NOT NULL COMMENT '公告类型（1通知 2公告）',
    `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
    `status`         char(1)       DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
    `create_by`      varchar(64)   DEFAULT '' COMMENT '创建者',
    `create_time`    bigint(15)    DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(64)   DEFAULT '' COMMENT '更新者',
    `update_time`    bigint(15)    DEFAULT NULL COMMENT '更新时间',
    `remark`         varchar(255)  DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='通知公告表';
CREATE TABLE `sys_oper_log`
(
    `oper_id`       int(11) NOT NULL AUTO_INCREMENT,
    `oper_name`     varchar(40)      DEFAULT NULL COMMENT '操作名称',
    `oper_ip`       varchar(20)      DEFAULT NULL COMMENT '操作者IP',
    `oper_location` varchar(100)     DEFAULT NULL COMMENT '操作者地点',
    `error_msg`     text COMMENT '错误信息',
    `login_name`    varchar(30)      DEFAULT NULL COMMENT '登录账号',
    `time`          bigint(13)       DEFAULT NULL COMMENT '操作耗时（ms）',
    `method`        varchar(200)     DEFAULT NULL COMMENT '操作方法',
    `oper_param`    text COMMENT '方法参数',
    `create_time`   bigint(13)       DEFAULT NULL,
    `status`        char(1) NOT NULL DEFAULT '1' COMMENT '0-错误1-正常',
    PRIMARY KEY (`oper_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 26
  DEFAULT CHARSET = utf8mb4;
CREATE TABLE `sys_post`
(
    `post_id`     bigint(20)  NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
    `post_code`   varchar(64) NOT NULL COMMENT '岗位编码',
    `post_name`   varchar(50) NOT NULL COMMENT '岗位名称',
    `post_sort`   int(4)      NOT NULL COMMENT '显示顺序',
    `status`      char(1)     NOT NULL DEFAULT '1' COMMENT '状态（1正常 0停用）',
    `create_by`   varchar(64)          DEFAULT '' COMMENT '创建者',
    `create_time` bigint(13)           DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64)          DEFAULT '' COMMENT '更新者',
    `update_time` bigint(13)           DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500)         DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='岗位';
CREATE TABLE `sys_role`
(
    `role_id`     int(11) NOT NULL AUTO_INCREMENT,
    `role_name`   varchar(30)                DEFAULT NULL,
    `role_key`    varchar(100)               DEFAULT NULL COMMENT '角色权限字符串',
    `role_sort`   int(4)                     DEFAULT NULL COMMENT '显示顺序',
    `data_scope`  char(1) CHARACTER SET utf8 DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
    `status`      char(1)                    DEFAULT '1' COMMENT '0-禁用1-正常',
    `del_flag`    char(1)                    DEFAULT '1' COMMENT '2-已删除1-正常',
    `create_by`   varchar(30)                DEFAULT NULL,
    `create_time` bigint(15)                 DEFAULT NULL,
    `update_by`   varchar(30)                DEFAULT NULL,
    `update_time` bigint(15)                 DEFAULT NULL,
    `remark`      varchar(300)               DEFAULT NULL,
    PRIMARY KEY (`role_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = utf8mb4 COMMENT ='角色';
CREATE TABLE `sys_role_dept`
(
    `role_id` bigint(11) NOT NULL COMMENT '角色ID',
    `dept_id` bigint(11) NOT NULL COMMENT '部门ID',
    PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='角色和部门关联表';
CREATE TABLE `sys_role_menu`
(
    `role_id` int(11) DEFAULT NULL,
    `menu_id` int(11) DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
CREATE TABLE `sys_user`
(
    `user_id`     int(11) NOT NULL AUTO_INCREMENT,
    `dept_id`     bigint(11)                     DEFAULT NULL COMMENT '部门ID',
    `login_name`  varchar(30)                    DEFAULT NULL,
    `username`    varchar(30)                    DEFAULT NULL,
    `email`       varchar(30)                    DEFAULT NULL,
    `telephone`   varchar(11)                    DEFAULT NULL,
    `sex`         char(1)                        DEFAULT '2' COMMENT '0-男1-女2-未知',
    `avatar`      varchar(120)                   DEFAULT '' COMMENT '头像路径',
    `password`    varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT '密码',
    `salt`        varchar(20) CHARACTER SET utf8 DEFAULT '' COMMENT '盐加密',
    `status`      char(1) CHARACTER SET utf8     DEFAULT '1' COMMENT '帐号状态（0禁用 1正常）',
    `del_flag`    char(1) CHARACTER SET utf8     DEFAULT '1' COMMENT '删除标志（1代表存在 2代表删除）',
    `login_ip`    varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT '最后登陆IP',
    `login_date`  bigint(15)                     DEFAULT NULL COMMENT '最后登陆时间',
    `create_by`   varchar(25) CHARACTER SET utf8 DEFAULT '' COMMENT '创建者',
    `create_time` bigint(15)                     DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(25) CHARACTER SET utf8 DEFAULT '' COMMENT '更新者',
    `update_time` bigint(15)                     DEFAULT NULL COMMENT '更新时间',
    `remark`      text CHARACTER SET utf8 COMMENT '备注',
    PRIMARY KEY (`user_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  DEFAULT CHARSET = utf8mb4;
CREATE TABLE `sys_user_post`
(
    `user_id` bigint(11) NOT NULL COMMENT '用户ID',
    `post_id` bigint(11) NOT NULL COMMENT '岗位ID',
    PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='用户与岗位关联表';
CREATE TABLE `sys_user_role`
(
    `user_id` int(11) DEFAULT NULL,
    `role_id` int(11) DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
CREATE TABLE `ums_permission`
(
    `perm_id`     int(11) NOT NULL AUTO_INCREMENT COMMENT '权限ID',
    `perm`        varchar(100) DEFAULT NULL COMMENT '权限字符串',
    `perm_name`   varchar(100) DEFAULT NULL COMMENT '权限名称',
    `status`      char(1)      DEFAULT '1' COMMENT '0-禁用1-正常',
    `create_by`   varchar(50)  DEFAULT NULL,
    `create_time` bigint(13)   DEFAULT NULL,
    `update_by`   varchar(50)  DEFAULT NULL,
    `update_time` bigint(13)   DEFAULT NULL,
    `remark`      varchar(300) DEFAULT NULL,
    PRIMARY KEY (`perm_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 14
  DEFAULT CHARSET = utf8mb4 COMMENT ='权限';
CREATE TABLE `ums_role`
(
    `role_id`     int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
    `role_key`    varchar(100) DEFAULT NULL COMMENT '角色字符串',
    `role_name`   varchar(100) DEFAULT NULL COMMENT '角色名称',
    `status`      char(1)      DEFAULT '1' COMMENT '角色状态0-禁用1-正常',
    `create_by`   varchar(50)  DEFAULT NULL,
    `create_time` bigint(13)   DEFAULT NULL,
    `update_by`   varchar(50)  DEFAULT NULL,
    `update_time` bigint(13)   DEFAULT NULL,
    `remark`      varchar(500) DEFAULT NULL,
    `del_flag`    char(1)      DEFAULT '1' COMMENT '2-已删除1-正常',
    PRIMARY KEY (`role_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 9
  DEFAULT CHARSET = utf8mb4 COMMENT ='角色';
CREATE TABLE `ums_role_perm`
(
    `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
    `perm_id` int(11) DEFAULT NULL COMMENT '字符串ID'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='角色权限';
CREATE TABLE `ums_user`
(
    `user_id`     int(11) NOT NULL AUTO_INCREMENT,
    `login_name`  varchar(25)                     DEFAULT NULL COMMENT '登录账号',
    `username`    varchar(20)                     DEFAULT NULL COMMENT '用户名',
    `u_account`   varchar(25)                     DEFAULT NULL COMMENT 'u号',
    `user_level`  int(2)                          DEFAULT '1' COMMENT '用户等级',
    `email`       varchar(30)                     DEFAULT NULL COMMENT '邮箱',
    `sex`         char(1) CHARACTER SET utf8      DEFAULT '2' COMMENT '用户性别（0男 1女 2未知）',
    `password`    varchar(100)                    DEFAULT NULL COMMENT '密码',
    `salt`        varchar(20)                     DEFAULT NULL COMMENT '加密盐',
    `avatar`      varchar(100)                    DEFAULT NULL COMMENT '头像路径',
    `telephone`   varchar(15)                     DEFAULT NULL COMMENT '手机号码',
    `del_flag`    char(1)                         DEFAULT '1' COMMENT '删除标志（1代表存在 2代表删除）',
    `login_ip`    varchar(30) CHARACTER SET utf8  DEFAULT '' COMMENT '最后登陆IP',
    `login_date`  bigint(15)                      DEFAULT NULL COMMENT '最后登陆时间',
    `open_id`     varchar(30)                     DEFAULT NULL COMMENT '开放id',
    `is_lock`     char(1)                         DEFAULT '0' COMMENT '0-可修改u号1-不可修改',
    `honor`       int(3)                          DEFAULT '400' COMMENT '信誉度',
    `exp`         int(10)                         DEFAULT '0' COMMENT '经验',
    `fans_num`    int(11)                         DEFAULT '0' COMMENT '粉丝量',
    `follow_num`  int(11)                         DEFAULT '0' COMMENT '关注量',
    `oid`         char(1)                         DEFAULT '4' COMMENT '个人信息公开程度4-所有人可见',
    `is_verify`   char(1)                         DEFAULT '0' COMMENT '1-已认证，0-未认证',
    `health`      int(2)                          DEFAULT '100' COMMENT '健康度',
    `ban_time`    bigint(15)                      DEFAULT NULL COMMENT '禁用账号到期时间',
    `update_time` bigint(15)                      DEFAULT NULL,
    `create_time` bigint(15)                      DEFAULT NULL,
    `remark`      varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
    `status`      char(1)                         DEFAULT '1' COMMENT '0-禁用1-正常',
    PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  DEFAULT CHARSET = utf8mb4 COMMENT ='app用户';
CREATE TABLE `ums_user_role`
(
    `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
    `role_id` int(11) DEFAULT NULL COMMENT '角色ID'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='app用户角色';
BEGIN;
LOCK TABLES `fun_base`.`gen_table` WRITE;
DELETE
FROM `fun_base`.`gen_table`;
INSERT INTO `fun_base`.`gen_table` (`table_id`, `table_name`, `table_comment`, `class_name`, `tpl_category`,
                                    `package_name`, `module_name`, `business_name`, `function_name`, `function_author`,
                                    `options`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES (24, 'ums_role_perm', '角色权限', 'AppRolePerm', 'crud', 'com.fun.project.app', 'user', 'perm', '角色权限', 'DJun',
        '{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}', 'admin', '2019-12-02 13:10:42', '',
        '2019-12-02 13:31:12', ''),
       (25, 'ums_permission', '权限', 'AppPermission', 'crud', 'com.fun.project.app', 'user', 'permission', '权限', 'DJun',
        '{\"treeName\":\"\",\"treeParentCode\":\"\",\"treeCode\":\"\"}', 'admin', '2019-12-02 15:00:41', '',
        '2019-12-02 15:01:44', '');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`gen_table_column` WRITE;
DELETE
FROM `fun_base`.`gen_table_column`;
INSERT INTO `fun_base`.`gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`,
                                           `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`,
                                           `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`,
                                           `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`)
VALUES (262, '24', 'role_id', '角色ID', 'int(11)', 'Long', 'roleId', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ',
        'input', '', 1, 'admin', '2019-12-02 13:10:42', NULL, '2019-12-02 13:31:12'),
       (263, '24', 'perm_id', '字符串ID', 'int(11)', 'Long', 'permId', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ',
        'input', '', 2, 'admin', '2019-12-02 13:10:42', NULL, '2019-12-02 13:31:12'),
       (264, '25', 'perm_id', '权限ID', 'int(11)', 'Long', 'permId', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ',
        'input', '', 1, 'admin', '2019-12-02 15:00:41', NULL, '2019-12-02 15:01:44'),
       (265, '25', 'perm', '权限字符串', 'varchar(100)', 'String', 'perm', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ',
        'input', '', 2, 'admin', '2019-12-02 15:00:41', NULL, '2019-12-02 15:01:44'),
       (266, '25', 'perm_name', '权限名称', 'varchar(100)', 'String', 'permName', '0', '0', NULL, NULL, NULL, NULL, NULL,
        'LIKE', 'input', '', 3, 'admin', '2019-12-02 15:00:41', NULL, '2019-12-02 15:01:44'),
       (267, '25', 'status', '角色状态0-禁用1-正常', 'char(1)', 'String', 'status', '0', '0', NULL, NULL, NULL, NULL, NULL,
        'EQ', 'radio', '', 4, 'admin', '2019-12-02 15:00:41', NULL, '2019-12-02 15:01:44'),
       (268, '25', 'create_by', 'null', 'varchar(50)', 'String', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL,
        'EQ', 'input', '', 5, 'admin', '2019-12-02 15:00:41', NULL, '2019-12-02 15:01:44'),
       (269, '25', 'create_time', 'null', 'bigint(13)', 'Long', 'createTime', '0', '0', NULL, NULL, NULL, NULL, NULL,
        'EQ', 'input', '', 6, 'admin', '2019-12-02 15:00:41', NULL, '2019-12-02 15:01:44'),
       (270, '25', 'update_by', 'null', 'varchar(50)', 'String', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL,
        'EQ', 'input', '', 7, 'admin', '2019-12-02 15:00:41', NULL, '2019-12-02 15:01:44'),
       (271, '25', 'update_time', 'null', 'bigint(13)', 'Long', 'updateTime', '0', '0', NULL, NULL, NULL, NULL, NULL,
        'EQ', 'input', '', 8, 'admin', '2019-12-02 15:00:41', NULL, '2019-12-02 15:01:44'),
       (272, '25', 'remark', 'null', 'varchar(300)', 'String', 'remark', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ',
        'input', '', 9, 'admin', '2019-12-02 15:00:41', NULL, '2019-12-02 15:01:44');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`qrtz_blob_triggers` WRITE;
DELETE
FROM `fun_base`.`qrtz_blob_triggers`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`qrtz_calendars` WRITE;
DELETE
FROM `fun_base`.`qrtz_calendars`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`qrtz_cron_triggers` WRITE;
DELETE
FROM `fun_base`.`qrtz_cron_triggers`;
INSERT INTO `fun_base`.`qrtz_cron_triggers` (`sched_name`, `trigger_name`, `trigger_group`, `cron_expression`,
                                             `time_zone_id`)
VALUES ('FunBootScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai'),
       ('FunBootScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai'),
       ('FunBootScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai'),
       ('MrDJunScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'GMT+08:00'),
       ('MrDJunScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'GMT+08:00'),
       ('MrDJunScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'GMT+08:00');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`qrtz_fired_triggers` WRITE;
DELETE
FROM `fun_base`.`qrtz_fired_triggers`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`qrtz_job_details` WRITE;
DELETE
FROM `fun_base`.`qrtz_job_details`;
INSERT INTO `fun_base`.`qrtz_job_details` (`sched_name`, `job_name`, `job_group`, `description`, `job_class_name`,
                                           `is_durable`, `is_nonconcurrent`, `is_update_data`, `requests_recovery`,
                                           `job_data`)
VALUES ('FunBootScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL,
        'com.cqjava.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0',
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720029636F6D2E63716A6176612E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002A636F6D2E63716A6176612E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800),
       ('FunBootScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL,
        'com.cqjava.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0',
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720029636F6D2E63716A6176612E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002A636F6D2E63716A6176612E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800),
       ('FunBootScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL,
        'com.cqjava.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0',
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720029636F6D2E63716A6176612E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002A636F6D2E63716A6176612E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800),
       ('MrDJunScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL,
        'com.cqjava.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0',
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720029636F6D2E63716A6176612E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002A636F6D2E63716A6176612E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800),
       ('MrDJunScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL,
        'com.cqjava.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0',
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720029636F6D2E63716A6176612E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002A636F6D2E63716A6176612E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800),
       ('MrDJunScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL,
        'com.cqjava.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0',
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720029636F6D2E63716A6176612E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002A636F6D2E63716A6176612E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`qrtz_locks` WRITE;
DELETE
FROM `fun_base`.`qrtz_locks`;
INSERT INTO `fun_base`.`qrtz_locks` (`sched_name`, `lock_name`)
VALUES ('FunBootScheduler', 'STATE_ACCESS'),
       ('FunBootScheduler', 'TRIGGER_ACCESS'),
       ('MrDJunScheduler', 'STATE_ACCESS'),
       ('MrDJunScheduler', 'TRIGGER_ACCESS');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`qrtz_paused_trigger_grps` WRITE;
DELETE
FROM `fun_base`.`qrtz_paused_trigger_grps`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`qrtz_scheduler_state` WRITE;
DELETE
FROM `fun_base`.`qrtz_scheduler_state`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`qrtz_simple_triggers` WRITE;
DELETE
FROM `fun_base`.`qrtz_simple_triggers`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`qrtz_simprop_triggers` WRITE;
DELETE
FROM `fun_base`.`qrtz_simprop_triggers`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`qrtz_triggers` WRITE;
DELETE
FROM `fun_base`.`qrtz_triggers`;
INSERT INTO `fun_base`.`qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`, `job_name`, `job_group`,
                                        `description`, `next_fire_time`, `prev_fire_time`, `priority`, `trigger_state`,
                                        `trigger_type`, `start_time`, `end_time`, `calendar_name`, `misfire_instr`,
                                        `job_data`)
VALUES ('FunBootScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1572853450000, -1, 5,
        'PAUSED', 'CRON', 1572853445000, 0, NULL, 2, ''),
       ('FunBootScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1572853455000, -1, 5,
        'PAUSED', 'CRON', 1572853445000, 0, NULL, 2, ''),
       ('FunBootScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1572853460000, -1, 5,
        'PAUSED', 'CRON', 1572853445000, 0, NULL, 2, ''),
       ('MrDJunScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1565603000000, -1, 5,
        'PAUSED', 'CRON', 1565602997000, 0, NULL, 2, ''),
       ('MrDJunScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1565603010000, -1, 5,
        'PAUSED', 'CRON', 1565602997000, 0, NULL, 2, ''),
       ('MrDJunScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1565603000000, -1, 5,
        'PAUSED', 'CRON', 1565602997000, 0, NULL, 2, '');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`sys_config` WRITE;
DELETE
FROM `fun_base`.`sys_config`;
INSERT INTO `fun_base`.`sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`,
                                     `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', 1572778805957, 'admin', 1575462516893,
        '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),
       (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', 1572778805957, 'admin', 1572778805957,
        '初始化密码 123456'),
       (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', 1572778805957, 'admin', 1572778805957,
        '深色主题theme-dark，浅色主题theme-light');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`sys_dept` WRITE;
DELETE
FROM `fun_base`.`sys_dept`;
INSERT INTO `fun_base`.`sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`,
                                   `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`,
                                   `update_time`)
VALUES (100, 0, '0', 'XXX科技股份有限公司', 0, 'MrDJun', '15888888888', 'mr.djun@qq.com', '1', '1', 'admin', 1572489468306,
        'admin', 1572489468306),
       (101, 100, '0,100', '上海总公司', 1, 'MrDJun', '15888888888', 'mr.djun@qq.com', '1', '1', 'admin', 1572489468306,
        'admin', 1572691998691),
       (102, 100, '0,100', '长沙分公司', 2, 'MrDJun', '15888888888', 'mr.djun@qq.com', '1', '1', 'admin', 1572489468306,
        'admin', 1572489468306),
       (103, 101, '0,100,101', '研发部门', 1, 'MrDJun', '15888888888', 'mr.djun@qq.com', '1', '1', 'admin', 1572489468306,
        'admin', 1572489468306),
       (104, 101, '0,100,101', '市场部门', 2, 'MrDJun', '15888888888', 'mr.djun@qq.com', '1', '1', 'admin', 1572489468306,
        'admin', 1572489468306),
       (105, 101, '0,100,101', '测试部门', 3, 'MrDJun', '15888888888', 'mr.djun@qq.com', '1', '1', 'admin', 1572489468306,
        'admin', 1572489468306),
       (106, 101, '0,100,101', '财务部门', 4, 'MrDJun', '15888888888', 'mr.djun@qq.com', '1', '1', 'admin', 1572489468306,
        'admin', 1572489468306),
       (107, 101, '0,100,101', '运维部门', 5, 'MrDJun', '15888888888', 'mr.djun@qq.com', '1', '1', 'admin', 1572489468306,
        'admin', 1572489468306),
       (108, 102, '0,100,102', '市场部门', 1, 'MrDJun', '15888888888', 'mr.djun@qq.com', '1', '1', 'admin', 1572489468306,
        'admin', 1572489468306),
       (109, 102, '0,100,102', '财务部门', 2, 'MrDJun', '15888888888', 'mr.djun@qq.com', '1', '1', 'admin', 1572489468306,
        'admin', 1572489468306);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`sys_dict_data` WRITE;
DELETE
FROM `fun_base`.`sys_dict_data`;
INSERT INTO `fun_base`.`sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`,
                                        `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`,
                                        `update_time`, `remark`)
VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '1', 'admin', 1572489468306, 'admin', 1572489468306, '性别男'),
       (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '1', 'admin', 1572489468306, 'admin', 1572489468306, '性别女'),
       (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '1', 'admin', 1572489468306, 'admin', 1572489468306, '性别未知'),
       (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '1', 'admin', 1572489468306, 'admin', 1572699650186,
        '显示菜单'),
       (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '1', 'admin', 1572489468306, 'admin', 1572699654819,
        '隐藏菜单'),
       (6, 1, '正常', '1', 'sys_normal_disable', '', 'primary', 'Y', '1', 'admin', 1572489468306, 'admin', 1572590433791,
        '正常状态'),
       (7, 2, '停用', '0', 'sys_normal_disable', '', 'danger', 'N', '1', 'admin', 1572489468306, 'admin', 1572590439098,
        '停用状态'),
       (8, 1, '正常', '1', 'sys_job_status', '', 'primary', 'Y', '1', 'admin', 1572489468306, 'admin', 1572960880382,
        '正常状态'),
       (9, 2, '暂停', '0', 'sys_job_status', '', 'danger', 'N', '1', 'admin', 1572489468306, 'admin', 1572960884392,
        '停用状态'),
       (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '1', 'admin', 1572489468306, 'admin', 1572489468306,
        '默认分组'),
       (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '1', 'admin', 1572489468306, 'admin', 1572489468306,
        '系统分组'),
       (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '1', 'admin', 1572489468306, 'admin', 1572489468306,
        '系统默认是'),
       (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '1', 'admin', 1572489468306, 'admin', 1572489468306, '系统默认否'),
       (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '1', 'admin', 1572489468306, 'admin', 1572489468306,
        '通知'),
       (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '1', 'admin', 1572489468306, 'admin', 1572489468306,
        '公告'),
       (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '1', 'admin', 1572489468306, 'admin', 1572489468306,
        '正常状态'),
       (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '1', 'admin', 1572489468306, 'admin', 1572489468306,
        '关闭状态'),
       (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '1', 'admin', 1572489468306, 'admin', 1572489468306,
        '新增操作'),
       (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '1', 'admin', 1572489468306, 'admin', 1572489468306,
        '修改操作'),
       (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '1', 'admin', 1572489468306, 'admin', 1572489468306,
        '删除操作'),
       (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '1', 'admin', 1572489468306, 'admin', 1572489468306,
        '授权操作'),
       (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '1', 'admin', 1572489468306, 'admin', 1572489468306,
        '导出操作'),
       (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '1', 'admin', 1572489468306, 'admin', 1572489468306,
        '导入操作'),
       (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '1', 'admin', 1572489468306, 'admin', 1572489468306,
        '强退操作'),
       (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '1', 'admin', 1572489468306, 'admin', 1572489468306,
        '生成操作'),
       (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '1', 'admin', 1572489468306, 'admin', 1572489468306,
        '清空操作'),
       (27, 1, '成功', '1', 'sys_common_status', '', 'primary', 'N', '1', 'admin', 1572489468306, 'admin', 1572834565450,
        '正常状态'),
       (28, 2, '失败', '0', 'sys_common_status', '', 'danger', 'N', '1', 'admin', 1572489468306, 'admin', 1572834569693,
        '停用状态'),
       (30, 1, '早餐', '1', 'sys_meal_type', '', '', 'N', '1', 'admin', 1572489468306, 'admin', 1572489468306, ''),
       (31, 2, '午餐', '2', 'sys_meal_type', '', '', 'N', '1', 'admin', 1572489468306, 'admin', 1572489468306, ''),
       (32, 3, '晚餐', '3', 'sys_meal_type', '', '', 'N', '1', 'admin', 1572489468306, 'admin', 1572489468306, ''),
       (33, 1, '测试', '1', 'ums_test_1', NULL, 'default', 'Y', '1', 'admin', 1572489468306, 'admin', NULL, NULL),
       (34, 2, '标签1', '1', 'sys_test_1', '', 'default', 'Y', '1', 'admin', 1572493057254, '', NULL, '标签1的描述内容');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`sys_dict_type` WRITE;
DELETE
FROM `fun_base`.`sys_dict_type`;
INSERT INTO `fun_base`.`sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`,
                                        `update_by`, `update_time`, `remark`)
VALUES (1, '用户性别', 'sys_user_sex', '1', 'admin', 1572489468306, 'admin', 1572489468306, '用户性别列表'),
       (2, '菜单状态', 'sys_show_hide', '1', 'admin', 1572489468306, 'admin', 1572489468306, '菜单状态列表'),
       (3, '系统开关', 'sys_normal_disable', '1', 'admin', 1572489468306, 'admin', 1572489468306, '系统开关列表'),
       (4, '任务状态', 'sys_job_status', '1', 'admin', 1572489468306, 'admin', 1572489468306, '任务状态列表'),
       (5, '任务分组', 'sys_job_group', '1', 'admin', 1572489468306, 'admin', 1572489468306, '任务分组列表'),
       (6, '系统是否', 'sys_yes_no', '1', 'admin', 1572489468306, 'admin', 1572489468306, '系统是否列表'),
       (7, '通知类型', 'sys_notice_type', '1', 'admin', 1572489468306, 'admin', 1572489468306, '通知类型列表'),
       (8, '通知状态', 'sys_notice_status', '1', 'admin', 1572489468306, 'admin', 1572489468306, '通知状态列表'),
       (9, '操作类型', 'sys_oper_type', '1', 'admin', 1572489468306, 'admin', 1572489468306, '操作类型列表'),
       (10, '系统状态', 'sys_common_status', '1', 'admin', 1572489468306, 'admin', 1572489468306, '登录状态列表');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`sys_job` WRITE;
DELETE
FROM `fun_base`.`sys_job`;
INSERT INTO `fun_base`.`sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`,
                                  `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`,
                                  `update_time`, `remark`)
VALUES (1, '系统默认（无参）', 'DEFAULT', 'FunBootTask.noParams', '0/10 * * * * ?', '3', '1', '0', 'admin', 1572963151046,
        'admin', 1572963151046, '无参示例'),
       (2, '系统默认（有参）', 'DEFAULT', 'FunBootTask.hasParams(\'mrdjun\')', '0/15 * * * * ?', '3', '1', '0', 'admin',
        1572963151046, 'admin', 1572963151046, '有参示例'),
       (3, '系统默认（多参）', 'DEFAULT', 'FunBootTask.multipleParams(\'mrdjun\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?',
        '3', '1', '0', 'admin', 1572963151046, 'admin', 1572963151046, '多参示例');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`sys_job_log` WRITE;
DELETE
FROM `fun_base`.`sys_job_log`;
INSERT INTO `fun_base`.`sys_job_log` (`job_log_id`, `job_name`, `job_group`, `invoke_target`, `job_message`, `status`,
                                      `exception_info`, `create_time`)
VALUES (1, '系统默认（有参）', 'DEFAULT', 'FunBootTask.hasParams(\'mrdjun\')', '系统默认（有参） 总共耗时：32毫秒', '1', '', 1575510180147),
       (2, '系统默认（有参）', 'DEFAULT', 'FunBootTask.hasParams(\'mrdjun\')', '系统默认（有参） 总共耗时：0毫秒', '1', '', 1575510195012),
       (3, '系统默认（有参）', 'DEFAULT', 'FunBootTask.hasParams(\'mrdjun\')', '系统默认（有参） 总共耗时：0毫秒', '1', '', 1575510210010),
       (4, '系统默认（有参）', 'DEFAULT', 'FunBootTask.hasParams(\'mrdjun\')', '系统默认（有参） 总共耗时：0毫秒', '1', '', 1575510330014),
       (5, '系统默认（多参）', 'DEFAULT', 'FunBootTask.multipleParams(\'mrdjun\', true, 2000L, 316.50D, 100)',
        '系统默认（多参） 总共耗时：0毫秒', '1', '', 1575510340014),
       (6, '系统默认（有参）', 'DEFAULT', 'FunBootTask.hasParams(\'mrdjun\')', '系统默认（有参） 总共耗时：0毫秒', '1', '', 1575510345015);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`sys_login_log` WRITE;
DELETE
FROM `fun_base`.`sys_login_log`;
INSERT INTO `fun_base`.`sys_login_log` (`info_id`, `login_name`, `login_location`, `ipaddr`, `os`, `browser`, `msg`,
                                        `create_time`, `status`)
VALUES (210, 'admin', '内网IP', '127.0.0.1', 'Windows 10', 'Chrome', '登录成功', 1575628855711, '1');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`sys_menu` WRITE;
DELETE
FROM `fun_base`.`sys_menu`;
INSERT INTO `fun_base`.`sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`,
                                   `visible`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`,
                                   `remark`)
VALUES (1, '系统管理', 0, 1, '#', '', 'M', '0', '', 'fa fa-gear', 'admin', 1571878039321, 'admin', 1571878039321, '系统管理目录'),
       (2, '系统监控', 0, 2, '#', '', 'M', '0', '', 'fa fa-heartbeat', 'admin', 1571878039321, 'admin', 1571878039321,
        '系统监控目录'),
       (3, '系统工具', 0, 3, '#', '', 'M', '0', '', 'fa fa-wrench', 'admin', 1571878039321, 'admin', 1571878039321,
        '系统工具目录'),
       (4, '用户管理', 1, 1, '/admin/system/user', 'menuItem', 'C', '0', 'system:user:view', '#', 'admin', 1571878039321,
        'admin', 1571878039321, '用户管理菜单'),
       (5, '角色管理', 1, 2, '/admin/system/role', 'menuItem', 'C', '0', 'system:role:view', '#', 'admin', 1571878039321,
        'admin', 1571878039321, '角色管理菜单'),
       (6, '菜单管理', 1, 3, '/admin/system/menu', 'menuItem', 'C', '0', 'system:menu:view', '#', 'admin', 1571878039321,
        'admin', 1571878039321, '菜单管理菜单'),
       (7, '代码生成', 3, 1, '/admin/tool/gen', 'menuItem', 'C', '0', 'tool:gen:view', '#', 'admin', 1571878039321, 'admin',
        1574815684924, NULL),
       (8, '字典管理', 1, 6, '/admin/system/dict', 'menuItem', 'C', '0', 'system:dict:view', '#', 'admin', 1571878039321,
        'admin', 1571878039321, NULL),
       (9, '表单构建', 3, 3, '/tool/table', 'menuItem', 'C', '0', '', '#', 'admin', 1571878039321, 'admin', 1574817178225,
        '表单生成工具'),
       (10, '服务监控', 2, 4, '/admin/monitor/server', 'menuItem', 'C', '0', 'monitor:server:view', '#', 'admin',
        1572705459463, 'admin', 1575627792285, NULL),
       (12, '配置管理', 1, 7, '/admin/system/config', 'menuItem', 'C', '0', 'system:config:view', '#', 'admin',
        1572781273526, 'admin', 1573184942068, NULL),
       (13, '部门管理', 1, 4, '/admin/system/dept', 'menuItem', 'C', '0', 'system:dept:view', '#', 'admin', 1572783055987,
        'admin', 1573184929177, NULL),
       (14, '岗位管理', 1, 5, '/admin/system/post', 'menuItem', 'C', '0', 'system:post:view', '#', 'admin', 1572783262252,
        '', NULL, NULL),
       (15, '登录日志', 2, 2, '/admin/monitor/loginlog', 'menuItem', 'C', '0', 'monitor:loginLog:view', '#', 'admin',
        1572785878367, 'admin', 1575627833439, NULL),
       (16, '操作日志', 2, 3, '/admin/monitor/operlog', 'menuItem', 'C', '0', 'monitor:operlog:view', '#', 'admin',
        1572785932090, 'admin', 1575627629672, NULL),
       (17, '接口文档', 3, 3, '/tool/swagger', 'menuItem', 'C', '0', 'tool:swagger:view', '#', 'admin', 1572792351293,
        'admin', 1573009087940, NULL),
       (19, '在线用户', 2, 1, '/admin/monitor/online', 'menuItem', 'C', '0', 'monitor:online:view', '#', 'admin',
        1572854710296, 'admin', 1572854770342, NULL),
       (20, 'Redis监控', 2, 5, '/admin/monitor/redis', 'menuItem', 'C', '0', 'monitor:redis:view', '#', 'admin',
        1572877806598, '', NULL, NULL),
       (21, '任务调度', 2, 6, '/admin/monitor/job', 'menuItem', 'C', '0', 'monitor:job:view', '#', 'admin', 1572960797613,
        '', NULL, NULL),
       (22, '数据监控', 2, 7, '/admin/monitor/data', 'menuItem', 'C', '0', 'monitor:data:view', '#', 'admin', 1573008427489,
        '', NULL, NULL),
       (23, '用户新增', 4, 2, '#', 'menuItem', 'F', '0', 'system:user:add', '#', 'admin', 1573181806223, 'admin',
        1573183919311, NULL),
       (24, '删除用户', 4, 3, '#', 'menuItem', 'F', '0', 'system:user:remove', '#', 'admin', 1573181872086, 'admin',
        1573183929222, NULL),
       (25, '用户修改', 4, 4, '#', 'menuItem', 'F', '0', 'system:user:edit', '#', 'admin', 1573181902364, 'admin',
        1573183935905, NULL),
       (26, '用户查询', 4, 1, '#', 'menuItem', 'F', '0', 'system:user:list', '#', 'admin', 1573183960222, '', NULL, NULL),
       (27, '重置密码', 4, 5, '#', 'menuItem', 'F', '0', 'system:user:resetPwd', '#', 'admin', 1573183990513, '', NULL,
        NULL),
       (28, '角色查询', 5, 1, '#', 'menuItem', 'F', '0', 'system:role:list', '#', 'admin', 1573184472932, '', NULL, NULL),
       (29, '角色新增', 5, 2, '#', 'menuItem', 'F', '0', 'system:role:add', '#', 'admin', 1573184493856, '', NULL, NULL),
       (30, '角色删除', 5, 3, '#', 'menuItem', 'F', '0', 'system:role:remove', '#', 'admin', 1573184521269, '', NULL, NULL),
       (31, '角色修改', 5, 4, '#', 'menuItem', 'F', '0', 'system:role:edit', '#', 'admin', 1573184568966, '', NULL, NULL),
       (32, '菜单查询', 6, 1, 'system:menu:list', 'menuItem', 'F', '0', 'system:menu:list', '#', 'admin', 1573184606344, '',
        NULL, NULL),
       (33, '菜单新增', 6, 2, '#', 'menuItem', 'F', '0', 'system:menu:add', '#', 'admin', 1573184849672, '', NULL, NULL),
       (34, '菜单修改', 6, 3, '#', 'menuItem', 'F', '0', 'system:menu:edit', '#', 'admin', 1573184871663, '', NULL, NULL),
       (35, '菜单删除', 6, 4, '#', 'menuItem', 'F', '0', 'system:menu:remove', '#', 'admin', 1573184895596, '', NULL, NULL),
       (36, '部门查询', 13, 1, '#', 'menuItem', 'F', '0', 'system:dept:list', '#', 'admin', 1573184966488, '', NULL, NULL),
       (37, '部门新增', 13, 2, '#', 'menuItem', 'F', '0', 'system:dept:add', '#', 'admin', 1573184992600, '', NULL, NULL),
       (38, '部门修改', 13, 3, '#', 'menuItem', 'F', '0', 'system:dept:edit', '#', 'admin', 1573185016506, '', NULL, NULL),
       (39, '部门删除', 13, 4, '#', 'menuItem', 'F', '0', 'system:dept:remove', '#', 'admin', 1573185043248, '', NULL,
        NULL),
       (40, '岗位查询', 14, 1, '#', 'menuItem', 'F', '0', 'system:post:list', '#', 'admin', 1573185078252, '', NULL, NULL),
       (41, '岗位新增', 14, 2, '#', 'menuItem', 'F', '0', 'system:post:add', '#', 'admin', 1573185098513, '', NULL, NULL),
       (42, '岗位修改', 14, 3, '#', 'menuItem', 'F', '0', 'system:post:edit', '#', 'admin', 1573185117329, '', NULL, NULL),
       (43, '岗位删除', 14, 4, '#', 'menuItem', 'F', '0', 'system:post:remove', '#', 'admin', 1573185140417, '', NULL,
        NULL),
       (44, '字典查询', 8, 1, '#', 'menuItem', 'F', '0', 'system:dict:list', '#', 'admin', 1573185177084, '', NULL, NULL),
       (45, '字典新增', 8, 2, '#', 'menuItem', 'F', '0', 'system:dict:add', '#', 'admin', 1573185199252, '', NULL, NULL),
       (46, '字典修改', 8, 3, '#', 'menuItem', 'F', '0', 'system:dict:edit', '#', 'admin', 1573185231015, '', NULL, NULL),
       (47, '字典删除', 8, 4, '#', 'menuItem', 'F', '0', 'system:dict:remove', '#', 'admin', 1573185252246, '', NULL, NULL),
       (48, '配置查询', 12, 1, '#', 'menuItem', 'F', '0', 'system:config:list', '#', 'admin', 1573185283464, '', NULL,
        NULL),
       (49, '参数新增', 12, 2, '#', 'menuItem', 'F', '0', 'system:config:add', '#', 'admin', 1573185317384, '', NULL, NULL),
       (50, '配置修改', 12, 3, '#', 'menuItem', 'F', '0', 'system:config:edit', '#', 'admin', 1573185339173, '', NULL,
        NULL),
       (51, '配置删除', 12, 4, '#', 'menuItem', 'F', '0', 'system:config:remove', '#', 'admin', 1573185358892, '', NULL,
        NULL),
       (52, '用户查询', 19, 1, '#', 'menuItem', 'F', '0', 'monitor:online:list', '#', 'admin', 1573185484492, '', NULL,
        NULL),
       (53, '强退用户', 19, 2, '#', 'menuItem', 'F', '0', 'monitor:online:remove', '#', 'admin', 1573185506716, '', NULL,
        NULL),
       (54, '登录日志查询', 15, 1, '#', 'menuItem', 'F', '0', 'monitor:loginLog:list', '#', 'admin', 1573185558747, '', NULL,
        NULL),
       (55, '登录日志删除', 15, 2, '#', 'menuItem', 'F', '0', 'monitor:loginLog:remove', '#', 'admin', 1573185622530, 'admin',
        1573185741329, NULL),
       (56, '登录日志清空', 15, 3, '#', 'menuItem', 'F', '0', 'monitor:loginLog:remove', '#', 'admin', 1573185649986, '',
        NULL, NULL),
       (57, '操作日志查询', 16, 1, '#', 'menuItem', 'F', '0', 'monitor:operlog:list', '#', 'admin', 1573185691431, '', NULL,
        NULL),
       (58, '操作日志删除', 16, 2, '#', 'menuItem', 'F', '0', 'monitor:operlog:remove', '#', 'admin', 1573185733128, '', NULL,
        NULL),
       (59, '操作日志清空', 16, 3, '#', 'menuItem', 'F', '0', 'monitor:operlog:remove', '#', 'admin', 1573185762257, '', NULL,
        NULL),
       (60, '任务查询', 21, 1, '#', 'menuItem', 'F', '0', 'monitor:job:list', '#', 'admin', 1573185999479, '', NULL, NULL),
       (61, '状态修改', 21, 2, '#', 'menuItem', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', 1573186061802, 'admin',
        1573186091324, NULL),
       (62, '任务详细', 21, 3, '#', 'menuItem', 'F', '0', 'monitor:job:detail', '#', 'admin', 1573186138216, '', NULL,
        NULL),
       (63, '操作日志详细', 16, 4, '#', 'menuItem', 'F', '0', 'monitor:operlog:detail', '#', 'admin', 1573186177579, '', NULL,
        NULL),
       (64, '任务新增', 21, 4, '#', 'menuItem', 'F', '0', 'monitor:job:add', '#', 'admin', 1573186231906, '', NULL, NULL),
       (65, '任务修改', 21, 5, '#', 'menuItem', 'F', '0', 'monitor:job:edit', '#', 'admin', 1573186264661, '', NULL, NULL),
       (66, '任务删除', 21, 6, '#', 'menuItem', 'F', '0', 'monitor:job:remove', '#', 'admin', 1573186319931, '', NULL,
        NULL),
       (71, '用户导出', 4, 6, '#', 'menuItem', 'F', '0', 'system:user:export', '#', 'admin', 1574747001380, '', NULL, NULL),
       (72, '用户导入', 4, 7, '#', 'menuItem', 'F', '0', 'system:user:import', '#', 'admin', 1574747029323, '', NULL, NULL),
       (73, '字典导出', 8, 5, '#', 'menuItem', 'F', '0', 'system:dict:export', '#', 'admin', 1574747077050, '', NULL, NULL),
       (74, '代码列表', 7, 1, '#', 'menuItem', 'F', '0', 'tool:gen:list', '#', 'admin', 1574747183708, 'admin',
        1574747244119, NULL),
       (75, '生成修改', 7, 2, '#', 'menuItem', 'F', '0', 'tool:gen:edit', '#', 'admin', 1574747302436, '', NULL, NULL),
       (76, '数据表删除', 7, 3, '#', 'menuItem', 'F', '0', 'tool:gen:remove', '#', 'admin', 1574747335931, '', NULL, NULL),
       (77, '代码预览', 7, 4, '#', 'menuItem', 'F', '0', 'tool:gen:preview', '#', 'admin', 1574747359271, '', NULL, NULL),
       (78, '生成代码', 7, 5, '#', 'menuItem', 'F', '0', 'tool:gen:code', '#', 'admin', 1574747397564, '', NULL, NULL),
       (79, 'App管理', 0, 4, '#', 'menuItem', 'M', '0', '', 'fa fa-puzzle-piece', 'admin', 1574815552378, 'admin',
        1574824497573, NULL),
       (81, '代码生成(App)', 3, 2, '/admin/tool/appgen', 'menuBlank', 'C', '0', 'tool:gen:view', '#', 'admin',
        1574817168544, 'admin', 1574844895066, NULL),
       (83, '用户管理', 79, 2, '/admin/app/user', 'menuItem', 'C', '0', 'app:user:view', '#', 'admin', 1574836224306, '',
        NULL, NULL),
       (85, '角色管理', 79, 2, '/admin/app/role', 'menuItem', 'C', '0', 'app:role:view', '#', 'admin', 1574999065970, '',
        NULL, NULL),
       (86, '权限管理', 79, 3, '/admin/app/perm', 'menuItem', 'C', '0', 'app:perm:view', '#', 'admin', 1575271618197, '',
        NULL, NULL),
       (87, '用户查看', 83, 1, '#', 'menuItem', 'F', '0', 'app:user:list', '#', 'admin', 1575381605453, '', NULL, NULL),
       (88, '用户导出', 83, 2, '#', 'menuItem', 'F', '0', 'app:user:export', '#', 'admin', 1575381633562, '', NULL, NULL),
       (89, '用户新增', 83, 3, '#', 'menuItem', 'F', '0', 'app:user:add', '#', 'admin', 1575381661023, '', NULL, NULL),
       (90, '用户修改', 83, 4, '#', 'menuItem', 'F', '0', 'app:user:edit', '#', 'admin', 1575381701981, '', NULL, NULL),
       (91, '用户删除', 83, 5, '#', 'menuItem', 'F', '0', 'app:user:remove', '#', 'admin', 1575381719373, '', NULL, NULL),
       (92, '角色查询', 85, 1, '#', 'menuItem', 'F', '0', 'app:role:list', '#', 'admin', 1575381788759, '', NULL, NULL),
       (93, '角色导出', 85, 2, '#', 'menuItem', 'F', '0', 'app:role:export', '#', 'admin', 1575381807299, '', NULL, NULL),
       (94, '角色新增', 85, 3, '#', 'menuItem', 'F', '0', 'app:role:add', '#', 'admin', 1575381827992, '', NULL, NULL),
       (95, '角色修改', 85, 4, '#', 'menuItem', 'F', '0', 'app:role:edit', '#', 'admin', 1575381851712, '', NULL, NULL),
       (96, '角色删除', 85, 5, '#', 'menuItem', 'F', '0', 'app:role:remove', '#', 'admin', 1575381878288, '', NULL, NULL),
       (97, '权限查看', 86, 1, '#', 'menuItem', 'F', '0', 'app:perm:list', '#', 'admin', 1575382010451, '', NULL, NULL),
       (98, '权限新增', 86, 2, '#', 'menuItem', 'F', '0', 'app:perm:add', '#', 'admin', 1575382026787, '', NULL, NULL),
       (99, '权限修改', 86, 3, '#', 'menuItem', 'F', '0', 'app:perm:edit', '#', 'admin', 1575382051135, '', NULL, NULL),
       (100, '权限删除', 86, 4, '#', 'menuItem', 'F', '0', 'app:perm:remove', '#', 'admin', 1575382068811, '', NULL, NULL);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`sys_notice` WRITE;
DELETE
FROM `fun_base`.`sys_notice`;
INSERT INTO `fun_base`.`sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`,
                                     `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES (1, '温馨提醒：2019-07-01 项目启动', '2', '项目启动', '0', 'admin', NULL, 'admin', NULL, '管理员'),
       (2, '维护通知：2019-11-11 系统凌晨维护', '1', '维护内容', '0', 'admin', NULL, 'admin', NULL, '管理员');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`sys_oper_log` WRITE;
DELETE
FROM `fun_base`.`sys_oper_log`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`sys_post` WRITE;
DELETE
FROM `fun_base`.`sys_post`;
INSERT INTO `fun_base`.`sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`,
                                   `create_time`, `update_by`, `update_time`, `remark`)
VALUES (1, 'ceo', '董事长', 1, '1', 'admin', 1572527286695, 'admin', NULL, ''),
       (2, 'se', '项目经理', 2, '1', 'admin', 1572527286695, 'admin', NULL, ''),
       (3, 'hr', '人力资源', 3, '1', 'admin', 1572527286695, 'admin', NULL, ''),
       (4, 'user', '普通员工', 4, '1', 'admin', 1572527286695, 'admin', 1572784712081, ''),
       (5, 'remote', '远程兼职', 5, '1', 'admin', 1572784688518, 'admin', 1572784729452, '临时远程兼职岗位');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`sys_role` WRITE;
DELETE
FROM `fun_base`.`sys_role`;
INSERT INTO `fun_base`.`sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `status`, `del_flag`,
                                   `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES (1, '超级管理员', 'admin', 1, '1', '1', '1', 'system', 1572690890413, 'admin', 1574670873850, '超级管理员'),
       (2, '普通管理员', 'common', 2, '1', '1', '1', 'system', 1572690890413, 'admin', 1574670873850, '超级管理员'),
       (3, '演示角色', 'show', 3, '1', '1', '1', 'admin', 1575623749621, 'admin', 1575628007175, '仅限演示时使用');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`sys_role_dept` WRITE;
DELETE
FROM `fun_base`.`sys_role_dept`;
INSERT INTO `fun_base`.`sys_role_dept` (`role_id`, `dept_id`)
VALUES (2, 100),
       (2, 101),
       (2, 105);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`sys_role_menu` WRITE;
DELETE
FROM `fun_base`.`sys_role_menu`;
INSERT INTO `fun_base`.`sys_role_menu` (`role_id`, `menu_id`)
VALUES (1, 1),
       (1, 2),
       (2, 1),
       (2, 4),
       (2, 26),
       (2, 23),
       (2, 27),
       (2, 5),
       (2, 28),
       (2, 6),
       (2, 32),
       (2, 33),
       (2, 34),
       (2, 35),
       (2, 13),
       (2, 36),
       (2, 14),
       (2, 40),
       (2, 8),
       (2, 44),
       (2, 12),
       (2, 48),
       (2, 2),
       (2, 21),
       (2, 60),
       (2, 3),
       (2, 7),
       (2, 9),
       (2, 17),
       (4, 1),
       (4, 4),
       (4, 26),
       (4, 23),
       (4, 24),
       (4, 25),
       (4, 27),
       (4, 71),
       (4, 72),
       (4, 5),
       (4, 28),
       (4, 29),
       (4, 30),
       (4, 31),
       (4, 6),
       (4, 32),
       (4, 33),
       (4, 34),
       (4, 35),
       (4, 13),
       (4, 36),
       (4, 37),
       (4, 38),
       (4, 39),
       (4, 14),
       (4, 40),
       (4, 41),
       (4, 42),
       (4, 43),
       (4, 8),
       (4, 44),
       (4, 45),
       (4, 46),
       (4, 47),
       (4, 73),
       (4, 12),
       (4, 48),
       (4, 49),
       (4, 50),
       (4, 51),
       (4, 2),
       (4, 19),
       (4, 52),
       (4, 53),
       (4, 15),
       (4, 54),
       (4, 55),
       (4, 56),
       (4, 16),
       (4, 57),
       (4, 58),
       (4, 59),
       (4, 63),
       (4, 10),
       (4, 20),
       (4, 21),
       (4, 60),
       (4, 61),
       (4, 62),
       (4, 64),
       (4, 65),
       (4, 66),
       (4, 22),
       (4, 3),
       (4, 7),
       (4, 74),
       (4, 75),
       (4, 76),
       (4, 77),
       (4, 78),
       (4, 81),
       (4, 9),
       (4, 17),
       (4, 79),
       (4, 83),
       (4, 87),
       (4, 88),
       (4, 89),
       (4, 90),
       (4, 91),
       (4, 85),
       (4, 92),
       (4, 93),
       (4, 94),
       (4, 95),
       (4, 96),
       (4, 86),
       (4, 97),
       (4, 98),
       (4, 99),
       (4, 100),
       (5, 1),
       (5, 4),
       (5, 26),
       (5, 23),
       (5, 24),
       (5, 25),
       (5, 27),
       (5, 71),
       (5, 72),
       (5, 5),
       (5, 28),
       (5, 29),
       (5, 30),
       (5, 31),
       (5, 6),
       (5, 32),
       (5, 33),
       (5, 34),
       (5, 35),
       (5, 13),
       (5, 36),
       (5, 37),
       (5, 38),
       (5, 39),
       (5, 14),
       (5, 40),
       (5, 41),
       (5, 42),
       (5, 43),
       (5, 8),
       (5, 44),
       (5, 45),
       (5, 46),
       (5, 47),
       (5, 73),
       (5, 12),
       (5, 48),
       (5, 49),
       (5, 50),
       (5, 51),
       (6, 1),
       (6, 4),
       (6, 26),
       (6, 23),
       (6, 24),
       (6, 25),
       (6, 27),
       (6, 71),
       (6, 72),
       (6, 5),
       (6, 28),
       (6, 29),
       (6, 30),
       (6, 31),
       (6, 6),
       (6, 32),
       (6, 33),
       (6, 34),
       (6, 35),
       (6, 13),
       (6, 36),
       (6, 37),
       (6, 38),
       (6, 39),
       (6, 14),
       (6, 40),
       (6, 41),
       (6, 42),
       (6, 43),
       (6, 8),
       (6, 44),
       (6, 45),
       (6, 46),
       (6, 47),
       (6, 73),
       (6, 12),
       (6, 48),
       (6, 49),
       (6, 50),
       (6, 51),
       (3, 1),
       (3, 4),
       (3, 26),
       (3, 5),
       (3, 28),
       (3, 6),
       (3, 32),
       (3, 13),
       (3, 36),
       (3, 14),
       (3, 40),
       (3, 8),
       (3, 44),
       (3, 12),
       (3, 48),
       (3, 2),
       (3, 19),
       (3, 52),
       (3, 15),
       (3, 54),
       (3, 16),
       (3, 57),
       (3, 10),
       (3, 20),
       (3, 21),
       (3, 60),
       (3, 22),
       (3, 3),
       (3, 7),
       (3, 74),
       (3, 77),
       (3, 81),
       (3, 9),
       (3, 17),
       (3, 79),
       (3, 83),
       (3, 87),
       (3, 85),
       (3, 92),
       (3, 86),
       (3, 97);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`sys_user` WRITE;
DELETE
FROM `fun_base`.`sys_user`;
INSERT INTO `fun_base`.`sys_user` (`user_id`, `dept_id`, `login_name`, `username`, `email`, `telephone`, `sex`,
                                   `avatar`, `password`, `salt`, `status`, `del_flag`, `login_ip`, `login_date`,
                                   `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES (1, 103, 'admin', '超级管理员', 'mr.djun@qq.com', '18683827876', '0', '', 'b35b89afc0e805106fdc6aeb0bc0f00f',
        '888888', '1', '1', '127.0.0.1', 1575628855723, 'system', 1570031706900, 'system', 1570031706900, '管理员'),
       (2, 105, 'mrdjun', '普通管理员', '903131009@qq.com', '15120016876', '0', '', 'a3373c8709be6bbd6b81df7319cb31b4',
        '0f0ac7', '1', '1', '127.0.0.1', 1575628551610, 'system', 1570031706900, 'admin', 1574432270374, '演示账号'),
       (7, 105, 'test01', '测试人员01', 'test01@qq.com', '18666666661', '0', '', '4a82e4f1348a9806fd826d422fa75a9a',
        '970cb9', '1', '1', '10.13.0.38', 1574056300931, 'admin', 1572748421140, 'admin', 1574056152868, '测试人员01'),
       (8, 105, 'test02', '测试人员02', 'test02@qq.com', '18666666662', '0', '', '452bbca25445486988274f6592651dbd',
        'aa1d55', '1', '1', '', NULL, 'admin', 1572776565175, 'admin', 1572778717196, '测试人员02'),
       (9, 105, 'test03', '测试人员03', 'test03@qq.com', '18666666663', '0', '', '7ba01784b204d7cd859a71d0ebe3478d',
        '2398bc', '0', '1', '10.127.105.174', 1572855282863, 'admin', 1572778805957, 'admin', 1575462294096, '测试人员03');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`sys_user_post` WRITE;
DELETE
FROM `fun_base`.`sys_user_post`;
INSERT INTO `fun_base`.`sys_user_post` (`user_id`, `post_id`)
VALUES (1, 1),
       (2, 2),
       (7, 4),
       (8, 4),
       (9, 4),
       (10, 4);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`sys_user_role` WRITE;
DELETE
FROM `fun_base`.`sys_user_role`;
INSERT INTO `fun_base`.`sys_user_role` (`user_id`, `role_id`)
VALUES (1, 1),
       (2, 3);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`ums_permission` WRITE;
DELETE
FROM `fun_base`.`ums_permission`;
INSERT INTO `fun_base`.`ums_permission` (`perm_id`, `perm`, `perm_name`, `status`, `create_by`, `create_time`,
                                         `update_by`, `update_time`, `remark`)
VALUES (1, 'user:view', '用户查看', '1', 'admin', 1574598479139, 'admin', 1575342127204, '仅权限获取测试使用'),
       (2, 'user:edit', '用户编辑', '1', 'admin', 1574598479139, 'admin', 1574598479140, '仅权限获取测试使用'),
       (3, 'user:delete', '用户删除', '1', 'admin', 1574598479139, 'admin', 1574598479141, '仅权限获取测试使用');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`ums_role` WRITE;
DELETE
FROM `fun_base`.`ums_role`;
INSERT INTO `fun_base`.`ums_role` (`role_id`, `role_key`, `role_name`, `status`, `create_by`, `create_time`,
                                   `update_by`, `update_time`, `remark`, `del_flag`)
VALUES (1, 'admin', '超级管理员', '1', 'admin', 1574598479139, 'admin', 1574598479200, '系统角色', '1'),
       (2, 'common', '管理员', '1', 'admin', 1574598479139, 'admin', 1575370271429, '系统角色', '1'),
       (3, 'regist', '注册用户', '1', 'admin', 1574598479139, 'admin', 1575461719646, '系统角色，注册用户默认角色', '1');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`ums_role_perm` WRITE;
DELETE
FROM `fun_base`.`ums_role_perm`;
INSERT INTO `fun_base`.`ums_role_perm` (`role_id`, `perm_id`)
VALUES (2, 1),
       (2, 2),
       (2, 3),
       (3, 1),
       (3, 2),
       (3, 3);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`ums_user` WRITE;
DELETE
FROM `fun_base`.`ums_user`;
INSERT INTO `fun_base`.`ums_user` (`user_id`, `login_name`, `username`, `u_account`, `user_level`, `email`, `sex`,
                                   `password`, `salt`, `avatar`, `telephone`, `del_flag`, `login_ip`, `login_date`,
                                   `open_id`, `is_lock`, `honor`, `exp`, `fans_num`, `follow_num`, `oid`, `is_verify`,
                                   `health`, `ban_time`, `update_time`, `create_time`, `remark`, `status`)
VALUES (1, 'admin', '一只管理员', '888888', 99, 'mr.djun@qq.com', '0', 'admin', '888888', NULL, '15888888888', '1',
        '127.0.0.1', 1575461596502, '191127118986171744250', '0', 400, 0, 888888, 2, '3', '1', 100, NULL, 1573908426827,
        1573908426827, NULL, '1'),
       (2, 'mrdjun', '群主大帅比', '666666', 1, '123456@qq.com', '0', 'mrdjun', '888888', NULL, '15888888887', '1',
        '10.127.105.84', 1574944843557, '191127118986171744251', '0', 400, 0, 0, 0, '3', '0', 100, NULL, 1573908426827,
        1573908426827, NULL, '1'),
       (3, 'test01', '测试账号', '666888', 1, 'test01@qq.com', '2', 'test01', '888888', NULL, '15888888886', '1',
        '127.0.0.1', 1574944843557, '191127118986171744252', '0', 400, 0, 0, 0, '4', '0', 100, NULL, 1573908426827,
        1573908426827, '修改测试', '1'),
       (4, 'test02', '竹影清风', '191127B6YBCDAMRP', 1, '903131009@qq.com', '2', 'test02', '123456',
        '/fun/img/avatar/default.png', '13212101110', '1', '127.0.0.1', 1575600871873, '191127118986171744253', '0',
        400, 0, 0, 0, '4', '0', 100, NULL, 1574998261698, 1574840737034, '', '1');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `fun_base`.`ums_user_role` WRITE;
DELETE
FROM `fun_base`.`ums_user_role`;
INSERT INTO `fun_base`.`ums_user_role` (`user_id`, `role_id`)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 3),
       (5, 3);
UNLOCK TABLES;
COMMIT;
