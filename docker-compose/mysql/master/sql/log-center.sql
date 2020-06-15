set sql_mode='';
set sql_mode='NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES';
CREATE DATABASE IF NOT EXISTS `log-center` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `log-center`;
SET FOREIGN_KEY_CHECKS=0;
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
drop table if exists sys_log;
create table sys_log (
  operator_id 		bigint(20) 		not null                   comment '日志主键',
  module            varchar(50)     default ''                 comment '模块标题',
  business_type     int(2)          default 0                  comment '业务类型（0=其它,1=新增,2=修改,3=删除,4=授权,5=导出,6=导入,7=强退,8=生成代码,9=清空数据）',
  method            varchar(100)    default ''                 comment '方法名称',
  operator_type     int(1)          default 0                  comment '操作类别（0其它 1后台用户 2手机端用户）',
  operator_name 	varchar(50)     default '' 		 	 	   comment '操作人员',
  operator_url 		varchar(255) 	default '' 				   comment '请求URL',
  operator_ip 		varchar(50) 	default '' 				   comment '主机地址',
  operator_params 	varchar(2000) 	default '' 				   comment '请求参数',
  status 			int(1) 		    default 0				   comment '操作状态（200正常 ***异常）',
  error_msg 		varchar(2000) 	default '' 				   comment '错误消息',
  operator_time 	datetime                                   comment '操作时间',
  primary key (operator_id)
) engine=innodb DEFAULT CHARSET=utf8mb4 comment = '操作日志记录';