CREATE DATABASE "log-center" /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
\c log-center;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
drop table if exists sys_log;
create table sys_log (
  operator_id 		int8 		    not null,                   -- '日志主键',
  module            varchar(50)     default '',                 -- '模块标题',
  business_type     int4            default 0,                  -- '业务类型（0=其它,1=新增,2=修改,3=删除,4=授权,5=导出,6=导入,7=强退,8=生成代码,9=清空数据）',
  method            varchar(100)    default '',                 -- '方法名称',
  operator_type     int4            default 0,                  -- '操作类别（0其它 1后台用户 2手机端用户）',
  operator_name 	varchar(50)     default '', 		 	 	-- '操作人员',
  operator_url 		varchar(255) 	default '', 				-- '请求URL',
  operator_ip 		varchar(50) 	default '', 				-- '主机地址',
  operator_params 	varchar(2000) 	default '', 				-- '请求参数',
  status 			int4 		    default 0,				    -- '操作状态（200正常 ***异常）',
  error_msg 		varchar(2000) 	default '', 				-- '错误消息',
  operator_time 	timestamp,                                  -- '操作时间',
  CONSTRAINT sys_log_table_pkey PRIMARY KEY (operator_id)
);