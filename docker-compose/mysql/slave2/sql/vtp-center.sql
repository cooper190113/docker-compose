set sql_mode='';
set sql_mode='NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES';
create database if not exists `portal-center` default character set = utf8mb4;
use `portal-center`;

-- ----------------------------
-- Table structure for task_schedule
-- ----------------------------
DROP TABLE IF EXISTS `task_schedule`;
CREATE TABLE `task_schedule` (
  `id`                                bigint(20)            NOT NULL          comment 'primary ID',
  `job_id`                            bigint(20)            NOT NULL          comment 'job ID',
  `job_name`                          varchar(100)          NOT NULL          comment 'job name',
  `cron_expression`                   varchar(255)                            comment 'timed task expression',
  `endpoint`                          varchar(255)                            comment 'callback request',
  `remark`                            varchar(255)                            comment 'job details',
  `execution_start_time`              bigint(20)            DEFAULT 0         comment 'task start time',
  `execution_type`                    varchar(100)          NOT NULL          comment 'task type',
  `fixed_execution_interval`          varchar(255)                            comment 'fixed task execution interval',
  `fixed_execution_unit`              varchar(255)                            comment 'fixed task execution interval unit',
  `last_fail_execution_start_time`    bigint(20)            DEFAULT 0         comment 'last task failure start time',
  `last_success_execution_start_time` bigint(20)            DEFAULT 0         comment 'last task successful start time',
  `success_execution_count`           bigint(20)            DEFAULT 0         comment 'number of successful tasks',
  `fail_execution_count`              bigint(20)            DEFAULT 0         comment 'number of failed tasks',
  `job_status`                        varchar(100)          NOT NULL          comment 'job status',
  `job_progress`                      bigint(20)            DEFAULT 0         comment 'job progress',
  `create_time`                       datetime                                comment 'create time',
  `update_time`                       datetime                                comment 'update time',
  PRIMARY KEY (`id`)
) engine=innodb default charset=utf8mb4 comment = '任务信息表';


-- ----------------------------
-- Table structure for task_schedule_case
-- ----------------------------
DROP TABLE IF EXISTS `task_schedule_case`;
CREATE TABLE `task_schedule_case` (
  `id`                                bigint(20)                  NOT NULL          comment 'primary ID',
  `job_id`                            bigint(20)                  NOT NULL          comment 'job ID',
  `case_id`                           bigint(20)                  NOT NULL          comment 'case ID',
  `execution_start_time`              bigint(20)                  DEFAULT 0         comment 'case start time',
  `consumes`                          bigint(20)                                    comment 'case execution time in milliseconds',
  `job_execution_start_time`          bigint(20)                  DEFAULT 0         comment 'job start time',
  `case_status`                       varchar(100)                NOT NULL          comment 'case status',
  `request_id`                        varchar(100)                            comment 'task execution request ID',
  `parameters`	                      varchar(5000)                           comment 'case parameters',
  `executions_result`	              varchar(10000)                          comment 'executions result',
  `create_time`                       datetime                                comment 'create time',
  `update_time`                       datetime                                comment 'update time',
  PRIMARY KEY (`id`)
)engine=innodb default charset=utf8mb4;

-- --------------------------------------------------------
-- Table structure for business_job_sut
-- --------------------------------------------------------
DROP TABLE IF EXISTS `business_job_sut`;
CREATE TABLE `business_job_sut` (
  `job_id`          bigint(20)             NOT NULL            comment 'Job ID',
  `sut_id`          bigint(20)             NOT NULL            comment 'sut ID'
)engine=innodb default charset=utf8mb4;

-- --------------------------------------------------------
-- Table structure for business_job_spec
-- --------------------------------------------------------
DROP TABLE IF EXISTS `business_job_spec`;
CREATE TABLE `business_job_spec` (
  `job_id`          bigint(20)             NOT NULL             comment 'Job Id',
  `spec_id`         bigint(20)             NOT NULL             comment 'Test Specification ID'
)engine=innodb default charset=utf8mb4;

-- --------------------------------------------------------
-- Table structure for business_job_case
-- --------------------------------------------------------
DROP TABLE IF EXISTS `business_job_case`;
CREATE TABLE `business_job_case` (
  `job_id`          bigint(20)             NOT NULL             comment 'Job Id',
  `case_id`         bigint(20)             NOT NULL             comment 'Case ID',
  `parameters`	    varchar(5000)          NOT NULL             comment 'case parameters'
)engine=innodb default charset=utf8mb4;

-- --------------------------------------------------------
-- Table structure for business_job_vim
-- --------------------------------------------------------
DROP TABLE IF EXISTS `business_job_vim`;
CREATE TABLE `business_job_vim` (
  `job_id`          bigint(20)             NOT NULL             comment 'Job ID',
  `vim_id`          bigint(20)             NOT NULL             comment 'VIM ID'
)engine=innodb default charset=utf8mb4;

-- --------------------------------------------------------
-- Table structure for business_job_vnfm
-- --------------------------------------------------------
DROP TABLE IF EXISTS `business_job_vnfm`;
CREATE TABLE `business_job_vnfm` (
  `job_id`          bigint(20)             NOT NULL             comment 'Job ID',
  `vnfm_id`         bigint(20)             NOT NULL             comment 'vnfm ID'
)engine=innodb default charset=utf8mb4;

-- --------------------------------------------------------
-- Table structure for business_job_suite
-- --------------------------------------------------------
DROP TABLE IF EXISTS `business_job_suite`;
CREATE TABLE `business_job_suite` (
  `job_id`          bigint(20)             NOT NULL             comment 'Job Id',
  `suite_id`        bigint(20)             NOT NULL             comment 'suite ID'
)engine=innodb default charset=utf8mb4;

-- --------------------------------------------------------
-- Table structure for business_job_mano
-- --------------------------------------------------------
DROP TABLE IF EXISTS `business_job_mano`;
CREATE TABLE `business_job_mano` (
  `job_id`          bigint(20)             NOT NULL             comment 'Job Id',
  `mano_id`         bigint(20)             NOT NULL             comment 'Mano ID'
)engine=innodb default charset=utf8mb4;


-- --------------------------------------------------------
-- Table structure for business_dict
-- --------------------------------------------------------
DROP TABLE IF EXISTS `business_dict`;
CREATE TABLE `business_dict`(
 `code`              		bigint(20)  		not null 					comment 'dictionary code',
 `dict_label`        		varchar(100)    	default ''                  comment 'dictionary label',
 `dict_value`        		varchar(100)    	default ''                  comment 'dictionary value',
 `dict_parent_code`  		bigint(20)                  					comment 'dictionary parent code',
 `status`            		tinyint(1)          not null default '1'        comment 'status（0-normal 1-停用）',
 `remark`            		varchar(500)    	default null                comment 'remark',
 `lang`              		varchar(50)     	default '0'                 comment 'lang',
 PRIMARY KEY (`code`)
)engine=innodb default charset=utf8mb4;

INSERT INTO `business_dict` VALUES (100, 'XNF', '1', -1, '0', NULL, '0');
INSERT INTO `business_dict` VALUES (101, 'VNF', '1', 100, '0', NULL, '0');
INSERT INTO `business_dict` VALUES (102, 'PNF', '2', 100, '0', NULL, '0');
INSERT INTO `business_dict` VALUES (103, 'NFVI', '3', 100, '0', NULL, '0');
INSERT INTO `business_dict` VALUES (101001, 'MME', '1', 101, '0', NULL, '0');
INSERT INTO `business_dict` VALUES (101002, 'PCRF', '2', 101, '0', NULL, '0');
INSERT INTO `business_dict` VALUES (101003, 'SPGW', '3', 101, '0', NULL, '0');
INSERT INTO `business_dict` VALUES (101004, 'FW', '4', 101, '0', NULL, '0');
INSERT INTO `business_dict` VALUES (101005, 'DNS', '5', 101, '0', NULL, '0');
INSERT INTO `business_dict` VALUES (101006, 'TAS ', '6', 101, '0', NULL, '0');
INSERT INTO `business_dict` VALUES (101007, 'HSS', '7', 101, '0', NULL, '0');
INSERT INTO `business_dict` VALUES (101008, 'OVPCommon', '8', 101, '0', NULL, '0');
INSERT INTO `business_dict` VALUES (200, 'Mano', '1', -1, '0', NULL, '0');
INSERT INTO `business_dict` VALUES (200001, 'Onap', '1', 200, '0', NULL, '0');
INSERT INTO `business_dict` VALUES (1000, 'VIM', '1', -1, '0', NULL, '0');
INSERT INTO `business_dict` VALUES (1001, 'openstack', '1', 1000, '0', NULL, '0');
INSERT INTO `business_dict` VALUES (1003, 'vmware', '3', 1000, '0', NULL, '0');
INSERT INTO `business_dict` VALUES (1002, 'Azure', '2', 1000, '0', NULL, '0');
INSERT INTO `business_dict` VALUES (1004, 'FusionSphere', '4', 1000, '0', NULL, '0');
INSERT INTO `business_dict` VALUES (1005, 'StarlingX', '5', 1000, '0', NULL, '0');

-- -----------------------Test object management table----------------------
DROP TABLE IF EXISTS `business_sut_mgt`;

CREATE TABLE `business_sut_mgt` (
  `id`                  bigint(20)       NOT NULL 		comment 'ID',
  `name`                varchar(50)      NOT NULL       comment 'name',
  `type`    	        bigint(20)       NOT NULL       comment 'type',
  `vendor`              varchar(100)     NOT NULL       comment 'vendor',
  `version`             varchar(100)     NOT NULL       comment 'version',
  `create_time`         datetime              		    comment 'create time',
  `update_time`         datetime              		    comment 'update time',
  `file_name`           varchar(255)     NOT NULL       comment 'file name',
  `file_alias_name`	    varchar(255)     NOT NULL       comment 'file alias name',
  `flag`   		        bigint(20)       NOT NULL       comment 'flag VNF|PNF|NFVI',
  PRIMARY KEY (`id`)
)engine=innodb default charset=utf8mb4;


-- --------------------Test environment management vim table----------------------
DROP TABLE IF EXISTS `business_vim_env_mgt`;

CREATE TABLE `business_vim_env_mgt` (
  `id`          		bigint(20)        NOT NULL 	     comment 'ID',
  `status` 				varchar(50)       				 comment 'status',
  `cloud_owner` 		varchar(100)      NOT NULL       comment 'cloud owner',
  `cloud_region_id`		varchar(100)      NOT NULL       comment 'cloud region id',
  `cloud_type`			bigint(20)		  NOT NULL       comment 'cloud type',
  `cloud_version`		varchar(100)      NOT NULL       comment 'cloud version',
  `cloud_domain`		varchar(100)      NOT NULL       comment 'cloud domain',
  `username`        	varchar(100)      NOT NULL       comment 'username',
  `password`			varchar(100)      NOT NULL       comment 'password',
  `default_tenant`		varchar(100)      NOT NULL       comment 'default tenant',
  `create_time` 		datetime               		     comment 'create time',
  `update_time`			datetime              		     comment 'update time',
  `auth_url`			varchar(100)      NOT NULL       comment 'auth url',
  `tenant`				varchar(100)       			     comment 'tenant',
  `ssl_cacert`			varchar(100)       			     comment 'ssl cacert',
  `ssl_insecure`		varchar(100)      NOT NULL       comment 'ssl insecure',
  PRIMARY KEY (`id`)
)engine=innodb default charset=utf8mb4;


-- --------------------Test environment management vnfm table----------------------
DROP TABLE IF EXISTS `business_vnfm_env_mgt`;
CREATE TABLE `business_vnfm_env_mgt` (
  `id`          		bigint(20)       NOT NULL  	    comment 'ID',
  `name` 				varchar(100)     NOT NULL       comment 'name',
  `type` 				varchar(50)      NOT NULL       comment 'type',
  `vendor`			    varchar(50)  	 NOT NULL       comment 'vendor',
  `version`				varchar(50)      NOT NULL       comment 'version',
  `url`					varchar(150)     NOT NULL       comment 'url',
  `vim`					varchar(50)      NOT NULL       comment 'vim',
  `create_time` 		datetime              		    comment 'create time',
  `update_time`			datetime              		    comment 'update time',
  `username`        	varchar(50)                     comment 'username',
  `password`			varchar(50)                     comment 'password',
  `certificate_url`		varchar(150)                    comment 'certificate url',
  PRIMARY KEY (`id`)
)engine=innodb default charset=utf8mb4;


-- -----------------------Test instrument management table----------------------
DROP TABLE IF EXISTS `business_inst_mgs`;
CREATE TABLE `business_inst_mgs` (
  `id`          		bigint(20)       NOT NULL 		comment 'ID',
  `name`        		varchar(50)      NOT NULL       comment 'name',
  `vendor`      		varchar(100)     NOT NULL       comment 'vendor',
  `mnt_address`			varchar(255)     NOT NULL       comment 'mnt address',
  `create_time` 		datetime              		    comment 'create time',
  `update_time`			datetime              		    comment 'update time',
  `username`        	varchar(100)     NOT NULL       comment 'username',
  `password`			varchar(100)     NOT NULL       comment 'password',
  PRIMARY KEY (`id`)
)engine=innodb default charset=utf8mb4;


-- -----------------------Test instrument package management table----------------------
DROP TABLE IF EXISTS `business_suite_mgt`;
CREATE TABLE `business_suite_mgt` (
  `id`          		bigint(20)       NOT NULL 		comment 'ID',
  `name`        		varchar(50)      NOT NULL       comment 'name',
  `vendor`      		varchar(100)  	 NOT NULL       comment 'vendor',
  `version`				varchar(50)      NOT NULL       comment 'version',
  `type`				bigint(20)       NOT NULL       comment 'type',
  `instrument_mgs_id`	bigint(20)       NOT NULL       comment 'instrument_mgs_id',
  `file_name`			varchar(255)     NOT NULL       comment 'file name',
  `file_alias_name`	    varchar(255)     NOT NULL       comment 'file alias name',
  `flag`        		bigint(20)	     NOT NULL       comment 'flag VFN|PNF',
  `create_time` 		datetime              		    comment 'create time',
  `update_time` 		datetime              		    comment 'update time',
  PRIMARY KEY (`id`)
)engine=innodb default charset=utf8mb4;

-- ----------------Test case management table----------------------
DROP TABLE IF EXISTS `business_case_mgt`;
CREATE TABLE `business_case_mgt` (
  `id`          		bigint(20)       NOT NULL 		comment 'ID',
  `number`          	varchar(50)  	 				comment 'number',
  `name`        		varchar(500)     NOT NULL       comment 'name',
  `description`			varchar(5000)    NOT NULL       comment 'description',
  `version`				varchar(50)      NOT NULL       comment 'version',
  `status`				varchar(50)      NOT NULL       comment 'status',
  `sut_type`			bigint(20)                      comment 'The parent type',
  `sub_sut_type`		bigint(20)                      comment 'sub sut type',
  `executions`	        varchar(50)                     comment 'executions',
  `parameters`	        varchar(5000)                   comment 'parameters',
  `group_type`		    bigint(20)                      comment 'group_type[1:common、2:CLI ... 99:Common]',
  `create_time` 		datetime              		    comment 'create time',
  `update_time` 		datetime              		    comment 'update time',
  PRIMARY KEY (`id`)
)engine=innodb default charset=utf8mb4;

-- ----------------Test specification sheet----------------------
DROP TABLE IF EXISTS `business_spec_mgt`;
CREATE TABLE `business_spec_mgt` (
  `id`          		bigint(20)       NOT NULL 		comment 'ID',
  `name`        		varchar(100)     NOT NULL       comment 'name',
  `version`				varchar(50)      NOT NULL       comment 'version',
  `sut_type`			bigint(20)       NOT NULL       comment 'The parent type',
  `sub_sut_type`		bigint(20)       NOT NULL       comment 'sub sut type',
  `publish_org`			varchar(50)      NOT NULL       comment 'publish org',
  `publish_time` 		datetime              		    comment 'publish time',
  `update_time`			datetime  					    comment 'update time',
  PRIMARY KEY (`id`)
)engine=innodb default charset=utf8mb4;

-- ----------------Test specifications are associated with use case tables----------------------
DROP TABLE IF EXISTS `business_spec_case`;
CREATE TABLE `business_spec_case` (

  `spec_id`       bigint(20)     	NOT NULL        comment 'spec id',
  `case_id`       bigint(20)     	NOT NULL	    comment 'case id'
)engine=innodb default charset=utf8mb4;

-- ----------------mano management table----------------------
DROP TABLE IF EXISTS `business_mano_mgt`;
CREATE TABLE `business_mano_mgt` (
  `id`          		bigint(20)       NOT NULL 		comment 'ID',
  `name`        		varchar(500)     NOT NULL       comment 'name',
  `version`				varchar(50)      NOT NULL       comment 'version',
  `vendor`				varchar(50)      NOT NULL       comment 'vendor',
  `type`			    bigint(20)                      comment 'The mano type',
  `profiles`	        varchar(1000)                   comment 'profiles',
  `create_time` 		datetime              		    comment 'create time',
  `update_time` 		datetime              		    comment 'update time',
  PRIMARY KEY (`id`)
)engine=innodb default charset=utf8mb4;
