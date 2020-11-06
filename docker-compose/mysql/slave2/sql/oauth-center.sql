set sql_mode='';
set sql_mode='NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES';
create database if not exists `oauth-center` default character set = utf8mb4;
use `oauth-center`;
#-- ---------------------------------------------------------
# 1.structure for table "oauth_client_details"
#-- ---------------------------------------------------------
drop table if exists `oauth_client_details`;
create table `oauth_client_details` (
  `id`                       int(11) not null auto_increment     comment '主键',
  `client_id`                varchar(48) not null                comment '应用标识',
  `resource_ids`             varchar(256) default null           comment '资源限定串(逗号分割)',
  `client_secret`            varchar(256) default null           comment '应用密钥(bcyt) 加密',
  `client_secret_str`        varchar(256) default null           comment '应用密钥(明文)',
  `scope`                    varchar(256) default null           comment '范围',
  `authorized_grant_types`   varchar(256) default null           comment '5种oauth授权方式(authorization_code,password,refresh_token,client_credentials)',
  `web_server_redirect_uri`  varchar(256) default null           comment '回调地址 ',
  `authorities` varchar(256) default null                        comment '权限',
  `access_token_validity`    int(11) default null                comment 'access_token有效期',
  `refresh_token_validity`   int(11) default null                comment 'refresh_token有效期',
  `additional_information`   varchar(4096) default '{}'          comment '{}',
  `autoapprove` varchar(256) default null                        comment '是否自动授权 是-true',
  `status` int(1)            default null                        comment '',
  primary key (`id`)
) engine=innodb auto_increment=13 default charset=utf8;


INSERT INTO oauth_client_details VALUES (1, 'webapp', NULL, '$2a$10$f3Hadkac5vBjjDMhBOmi.e.AUP.Q2.UeHzGLug.7O5ZJzEDjEIw9u', NULL, 'web', 'authorization_code,password,refresh_token,client_credentials,mobile,mail', NULL, NULL, 1800, NULL, '{}', 'true', 1);


-- -----------------------------------------------------------
-- structure for table "oauth_access_token"
-- -----------------------------------------------------------
drop table if exists oauth_access_token;
create table oauth_access_token (
  create_time        timestamp default now(),
  token_id           varchar(255),
  token              blob,
  authentication_id  varchar(255),
  user_name          varchar(255),
  client_id          varchar(255),
  authentication     blob,
  refresh_token      varchar(255)
) engine=innodb default charset=utf8mb4 comment 'oauth_access_token';

-- -----------------------------------------------------------
-- structure for table "oauth_refresh_token"
-- -----------------------------------------------------------
drop table if exists oauth_refresh_token;
create table oauth_refresh_token (
  create_time    timestamp default now(),
  token_id       varchar(255),
  token          blob,
  authentication blob
) engine=innodb default charset=utf8mb4 comment 'oauth_refresh_token';