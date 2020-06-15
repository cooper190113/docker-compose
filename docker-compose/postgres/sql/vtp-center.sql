CREATE DATABASE "portal-center";
\c portal-center;

-- ----------------------------
-- Table structure for task_schedule
-- ----------------------------
DROP TABLE IF EXISTS "task_schedule";
CREATE TABLE "task_schedule" (
  "id"                                int8                  NOT NULL,          --'primary ID'
  "job_id"                            int8                  NOT NULL,          --'job ID'
  "job_name"                          varchar(100)          NOT NULL,          --'job name'
  "cron_expression"                   varchar(255),                            --'timed task expression'
  "endpoint"                          varchar(255),                            --'callback request'
  "remark"                            varchar(255),                            --'job details'
  "execution_start_time"              int8                  DEFAULT 0,         --'task start time'
  "execution_type"                    varchar(100)          NOT NULL,          --'task type'
  "fixed_execution_interval"          varchar(255),                            --'fixed task execution interval'
  "fixed_execution_unit"              varchar(255),                            --'fixed task execution interval unit'
  "last_fail_execution_start_time"    int8                  DEFAULT 0,         --'last task failure start time'
  "last_success_execution_start_time" int8                  DEFAULT 0,         --'last task successful start time'
  "success_execution_count"           int8                  DEFAULT 0,         --'number of successful tasks'
  "fail_execution_count"              int8                  DEFAULT 0,         --'number of failed tasks'
  "job_status"                        varchar(100)          NOT NULL,          --'job status'
  "job_progress"                      int8                  DEFAULT 0,         --'job progress'
  "create_time"                       timestamp,                               --'create time'
  "update_time"                       timestamp,                               --'update time'
  CONSTRAINT task_schedule_table_pkey PRIMARY KEY (id)
);


-- ----------------------------
-- Table structure for task_schedule_case
-- ----------------------------
DROP TABLE IF EXISTS "task_schedule_case";
CREATE TABLE "task_schedule_case" (
  "id"                                int8                  NOT NULL,          --'primary ID'
  "job_id"                            int8                  NOT NULL,          --'job ID'
  "case_id"                           int8                  NOT NULL,          --'case ID'
  "execution_start_time"              int8                  DEFAULT 0,         --'case start time'
  "consumes"                          int8,                                    --'case execution time in milliseconds'
  "job_execution_start_time"          int8                  DEFAULT 0,         --'job start time'
  "case_status"                       varchar(100)          NOT NULL,          --'case status'
  "request_id"                        varchar(100),                            --'task execution request ID'
  "parameters"	                      varchar(5000),                           --'case parameters'
  "executions_result"	              varchar(10000),                          --'executions result'
  "create_time"                       timestamp,                               --'create time'
  "update_time"                       timestamp,                               --'update time'
  CONSTRAINT task_schedule_case_table_pkey PRIMARY KEY (id)
);

-- --------------------------------------------------------
-- Table structure for business_job_sut
-- --------------------------------------------------------
DROP TABLE IF EXISTS "business_job_sut";
CREATE TABLE "business_job_sut" (
  "job_id"          int8             NOT NULL,            --'Job ID'
  "sut_id"          int8             NOT NULL             --'sut ID'
);

-- --------------------------------------------------------
-- Table structure for business_job_spec
-- --------------------------------------------------------
DROP TABLE IF EXISTS "business_job_spec";
CREATE TABLE "business_job_spec" (
  "job_id"          int8             NOT NULL,             --'Job Id'
  "spec_id"         int8             NOT NULL              --'Test Specification ID'
);

-- --------------------------------------------------------
-- Table structure for business_job_case
-- --------------------------------------------------------
DROP TABLE IF EXISTS "business_job_case";
CREATE TABLE "business_job_case" (
  "job_id"          int8             NOT NULL,             --'Job Id'
  "case_id"         int8             NOT NULL,             --'Case ID'
  "parameters"	    varchar(5000)    NOT NULL              --'case parameters'
);

-- --------------------------------------------------------
-- Table structure for business_job_vim
-- --------------------------------------------------------
DROP TABLE IF EXISTS "business_job_vim";
CREATE TABLE "business_job_vim" (
  "job_id"          int8             NOT NULL,             --'Job ID'
  "vim_id"          int8             NOT NULL              --'VIM ID'
);

-- --------------------------------------------------------
-- Table structure for business_job_vnfm
-- --------------------------------------------------------
DROP TABLE IF EXISTS "business_job_vnfm";
CREATE TABLE "business_job_vnfm" (
  "job_id"          int8             NOT NULL,             --'Job ID'
  "vnfm_id"         int8             NOT NULL              --'vnfm ID'
);

-- --------------------------------------------------------
-- Table structure for business_job_suite
-- --------------------------------------------------------
DROP TABLE IF EXISTS "business_job_suite";
CREATE TABLE "business_job_suite" (
  "job_id"          int8             NOT NULL,             --'Job Id'
  "suite_id"        int8             NOT NULL              --'suite ID'
);

-- --------------------------------------------------------
-- Table structure for business_job_mano
-- --------------------------------------------------------
DROP TABLE IF EXISTS "business_job_mano";
CREATE TABLE "business_job_mano" (
  "job_id"          int8             NOT NULL,             --'Job Id'
  "mano_id"         int8             NOT NULL              --'Mano ID'
);



-- -------------------------Type dictionary table----------------------
--
-- DROP TABLE IF EXISTS "business_dict";
--
-- CREATE TABLE business_dict
-- (
--  code           		int8    			not null,  					-- 'dictionary code',
--  dict_label        		varchar(100)    	default '',                 -- 'dictionary label',
--  dict_value        		varchar(100)    	default '',                 -- 'dictionary value',
--  status       			char(1)      		default '0',          		-- 'status（0-normal 1-block up）',
--  remark            		varchar(500)    	default null,        		-- 'remark',
--  lang        			varchar(50)   		default '0',          		-- 'lang',
--  CONSTRAINT business_dict_table_pkey PRIMARY KEY (code)
-- );

-------------------------Type dictionary word table----------------------

DROP TABLE IF EXISTS "business_dict";

CREATE TABLE business_dict
(
 code              		int8  				not null, 					 -- 'dictionary code',
 dict_label        		varchar(100)    	default '',                  -- 'dictionary label'
 dict_value        		varchar(100)    	default '',                  -- 'dictionary value'
 dict_parent_code  		int8,                  							 -- 'dictionary parent code'
 status            		char(1)         	default '0',                 -- 'status（0-normal 1-停用）'
 remark            		varchar(500)    	default null,                -- 'remark'
 lang              		varchar(50)     	default '0',                 -- 'lang'
 CONSTRAINT business_dict_table_pkey PRIMARY KEY (code)
);

INSERT INTO "business_dict" VALUES (100, 'XNF', '1', -1, '0', NULL, '0');
INSERT INTO "business_dict" VALUES (101, 'VNF', '1', 100, '0', NULL, '0');
INSERT INTO "business_dict" VALUES (102, 'PNF', '2', 100, '0', NULL, '0');
INSERT INTO "business_dict" VALUES (103, 'NFVI', '3', 100, '0', NULL, '0');
INSERT INTO "business_dict" VALUES (101001, 'MME', '1', 101, '0', NULL, '0');
INSERT INTO "business_dict" VALUES (101002, 'PCRF', '2', 101, '0', NULL, '0');
INSERT INTO "business_dict" VALUES (101003, 'SPGW', '3', 101, '0', NULL, '0');
INSERT INTO "business_dict" VALUES (101004, 'FW', '4', 101, '0', NULL, '0');
INSERT INTO "business_dict" VALUES (101005, 'DNS', '5', 101, '0', NULL, '0');
INSERT INTO "business_dict" VALUES (101006, 'TAS ', '6', 101, '0', NULL, '0');
INSERT INTO "business_dict" VALUES (101007, 'HSS', '7', 101, '0', NULL, '0');
INSERT INTO "business_dict" VALUES (101008, 'OVPCommon', '8', 101, '0', NULL, '0');
INSERT INTO "business_dict" VALUES (200, 'Mano', '1', -1, '0', NULL, '0');
INSERT INTO "business_dict" VALUES (200001, 'Onap', '1', 200, '0', NULL, '0');
INSERT INTO "business_dict" VALUES (1000, 'VIM', '1', -1, '0', NULL, '0');
INSERT INTO "business_dict" VALUES (1001, 'openstack', '1', 1000, '0', NULL, '0');
INSERT INTO "business_dict" VALUES (1003, 'vmware', '3', 1000, '0', NULL, '0');
INSERT INTO "business_dict" VALUES (1002, 'Azure', '2', 1000, '0', NULL, '0');
INSERT INTO "business_dict" VALUES (1004, 'FusionSphere', '4', 1000, '0', NULL, '0');
INSERT INTO "business_dict" VALUES (1005, 'StarlingX', '5', 1000, '0', NULL, '0');

-------------------------Test object management table----------------------

DROP TABLE IF EXISTS "business_sut_mgt";

CREATE TABLE "business_sut_mgt" (
  "id"                  int8             NOT NULL, 		 --'ID'
  "name"                varchar(50)      NOT NULL,       --'name'
  "type"    	        int8      		 NOT NULL,       --'type'
  "vendor"              varchar(100)     NOT NULL,       --'vendor'
  "version"             varchar(100)     NOT NULL,       --'version'
  "create_time"         timestamp,              		 --'create time'
  "update_time"         timestamp,              		 --'update time'
  "file_name"           varchar(255)     NOT NULL,       --'file name'
  "file_alias_name"	    varchar(255)     NOT NULL,       --'file alias name'
  "flag"   		        int8      		 NOT NULL,       --'flag VNF|PNF|NFVI'
  CONSTRAINT business_sut_mgt_table_pkey PRIMARY KEY (id)
);


----------------------Test environment management vim table----------------------

DROP TABLE IF EXISTS "business_vim_env_mgt";

CREATE TABLE "business_vim_env_mgt" (
  "id"          		int8              NOT NULL, 	  --'ID'
  "status" 				varchar(50),       				  --'status'
  "cloud_owner" 		varchar(100)      NOT NULL,       --'cloud owner'
  "cloud_region_id"		varchar(100)      NOT NULL,       --'cloud region id'
  "cloud_type"			int8		      NOT NULL,       --'cloud type'
  "cloud_version"		varchar(100)      NOT NULL,       --'cloud version'
  "cloud_domain"		varchar(100)      NOT NULL,       --'cloud domain'
  "username"        	varchar(100)      NOT NULL,       --'username'
  "password"			varchar(100)      NOT NULL,       --'password'
  "default_tenant"		varchar(100)      NOT NULL,       --'default tenant'
  "create_time" 		timestamp ,              		  --'create time'
  "update_time"			timestamp,              		  --'update time'
  "auth_url"			varchar(100)      NOT NULL,       --'auth url'
  "tenant"				varchar(100),       			  --'tenant'
  "ssl_cacert"			varchar(100),       			  --'ssl cacert'
  "ssl_insecure"		varchar(100)      NOT NULL,       --'ssl insecure'
  CONSTRAINT business_vim_env_mgt_table_pkey PRIMARY KEY (id)
);


----------------------Test environment management vnfm table----------------------

DROP TABLE IF EXISTS "business_vnfm_env_mgt";

CREATE TABLE "business_vnfm_env_mgt" (
  "id"          		int8             NOT NULL,  	 --'ID'
  "name" 				varchar(100)     NOT NULL,       --'name'
  "type" 				varchar(50)      NOT NULL,       --'type'
  "vendor"			    varchar(50)  	 NOT NULL,       --'vendor'
  "version"				varchar(50)      NOT NULL,       --'version'
  "url"					varchar(150)     NOT NULL,       --'url'
  "vim"					varchar(50)      NOT NULL,       --'vim'
  "create_time" 		timestamp,              		 --'create time'
  "update_time"			timestamp,              		 --'update time'
  "username"        	varchar(50)      ,       --'username'
  "password"			varchar(50)      ,       --'password'
  "certificate_url"		varchar(150)     ,       --'certificate url'
  CONSTRAINT business_vnfm_env_mgt_table_pkey PRIMARY KEY (id)
);


-------------------------Test instrument management table----------------------

DROP TABLE IF EXISTS "business_inst_mgs";


CREATE TABLE "business_inst_mgs" (
  "id"          		int8             NOT NULL, 		 --'ID'
  "name"        		varchar(50)      NOT NULL,       --'name'
  "vendor"      		varchar(100)     NOT NULL,       --'vendor'
  "mnt_address"			varchar(255)     NOT NULL,       --'mnt address'
  "create_time" 		timestamp,              		 --'create time'
  "update_time"			timestamp,              		 --'update time'
  "username"        	varchar(100)     NOT NULL,       --'username'
  "password"			varchar(100)     NOT NULL,       --'password'
  CONSTRAINT business_inst_mgs_table_pkey PRIMARY KEY (id)
);


-------------------------Test instrument package management table----------------------

DROP TABLE IF EXISTS "business_suite_mgt";

CREATE TABLE "business_suite_mgt" (
  "id"          		int8             NOT NULL, 		 --'ID'
  "name"        		varchar(50)      NOT NULL,       --'name'
  "vendor"      		varchar(100)  	 NOT NULL,       --'vendor'
  "version"				varchar(50)      NOT NULL,       --'version'
  "type"				int8      		 NOT NULL,       --'type'
  "instrument_mgs_id"	int8      	     NOT NULL,       --'instrument_mgs_id'
  "file_name"			varchar(255)     NOT NULL,       --'file name'
  "file_alias_name"	    varchar(255)     NOT NULL,       --'file alias name'
  "flag"        		int8	         NOT NULL,       --'flag VFN|PNF'
  "create_time" 		timestamp,              		 --'create time'
  "update_time" 		timestamp,              		 --'update time'
  CONSTRAINT business_suite_mgt_table_pkey PRIMARY KEY (id)
);

------------------Test case management table----------------------

DROP TABLE IF EXISTS "business_case_mgt";

CREATE TABLE "business_case_mgt" (
  "id"          		int8             NOT NULL, 		 --'ID'
  "number"          	varchar(50),  	 				 --'number'
  "name"        		varchar(500)     NOT NULL,       --'name'
  "description"			varchar(5000)    NOT NULL,       --'description'
  "version"				varchar(50)      NOT NULL,       --'version'
  "status"				varchar(50)      NOT NULL,       --'status'
  "sut_type"			int8,                            --'The parent type'
  "sub_sut_type"		int8,                            --'sub sut type'
  "executions"	        varchar(50),                     --'executions'
  "parameters"	        varchar(5000),                   --'parameters'
  "group_type"		    int8,                            --'group_type[1:common、2:CLI ... 99:Common]'
  "create_time" 		timestamp,              		 --'create time'
  "update_time" 		timestamp,              		 --'update time'
  CONSTRAINT business_case_mgt_table_pkey PRIMARY KEY (id)
);

------------------Test specification sheet----------------------

DROP TABLE IF EXISTS "business_spec_mgt";

CREATE TABLE "business_spec_mgt" (
  "id"          		int8             NOT NULL, 		 --'ID'
  "name"        		varchar(100)     NOT NULL,       --'name'
  "version"				varchar(50)      NOT NULL,       --'version'
  "sut_type"			int8      		 NOT NULL,       --'The parent type'
  "sub_sut_type"		int8      		 NOT NULL,       --'sub sut type'
  "publish_org"			varchar(50)      NOT NULL,       --'publish org'
  "publish_time" 		timestamp,              		 --'publish time'
  "update_time"			timestamp,  					 --'update time'
  CONSTRAINT business_spec_mgt_table_pkey PRIMARY KEY (id)
);

------------------Test specifications are associated with use case tables----------------------

DROP TABLE IF EXISTS "business_spec_case";

CREATE TABLE "business_spec_case" (

  "spec_id"       int8     	NOT NULL,       --'spec id'
  "case_id"       int8     	NOT NULL	    --'case id'
);

------------------mano management table----------------------
DROP TABLE IF EXISTS "business_mano_mgt";
CREATE TABLE "business_mano_mgt" (
  "id"          		int8             NOT NULL, 		 --'ID'
  "name"        		varchar(500)     NOT NULL,       --'name'
  "version"				varchar(50)      NOT NULL,       --'version'
  "vendor"				varchar(50)      NOT NULL,       --'vendor'
  "type"			    int8,                            --'The mano type'
  "profiles"	        varchar(1000),                   --'profiles'
  "create_time" 		timestamp,              		 --'create time'
  "update_time" 		timestamp,              		 --'update time'
  CONSTRAINT business_mano_mgt_table_pkey PRIMARY KEY (id)
);
