create database "oauth-center";
\c oauth-center;
-- --------------------------------------------------------
-- Table structure for oauth_client_details
-- --------------------------------------------------------
DROP TABLE IF EXISTS "oauth_client_details";

CREATE TABLE "oauth_client_details"  (
  "id"                         int4            NOT NULL,       --'primary key'
  "client_id"                  varchar(48)     NULL,           --'client id'
  "resource_ids"               varchar(256)    NULL,           --'resource_ids(separated by ,)'
  "client_secret"              varchar(256)    NULL,           --'client secret(encryption)'
  "client_secret_str"          varchar(256)    NULL,           --'client secret(plaintext)'
  "scope"                      varchar(256)    NULL,           --'scope'
  "authorized_grant_types"     varchar(256)    NULL,           --'6(authorization_code,password,refresh_token,client_credentials,mobile)'
  "web_server_redirect_uri"    varchar(256)    NULL,           --'callback url'
  "authorities"                varchar(256)    NULL,           --'authorities'
  "access_token_validity"      int4            NULL,           --'access_token validity',
  "refresh_token_validity"     int4            NULL,           --'refresh_token validity',
  "additional_information"     varchar(4096)   NULL,           --'additional_information',
  "autoapprove"                varchar(256)    NULL,           --'whether to authorize automatically Yes-true'
  "status"                     int4            NULL,
  CONSTRAINT oauth_client_details_pkey PRIMARY KEY (id)
);

INSERT INTO "oauth_client_details" VALUES (1, 'webapp', NULL, '$2a$10$f3Hadkac5vBjjDMhBOmi.e.AUP.Q2.UeHzGLug.7O5ZJzEDjEIw9u', NULL, 'web', 'authorization_code,password,refresh_token,client_credentials,mobile,mail', NULL, NULL, 1800, NULL, '{}', 'true', 1);

-------------------------------------------------------------
-- structure for table "oauth_access_token"
-------------------------------------------------------------
drop table if exists oauth_access_token;
create table oauth_access_token (
  create_time        timestamp default now(),
  token_id           varchar(255),
  token              bytea,
  authentication_id  varchar(255),
  user_name          varchar(255),
  client_id          varchar(255),
  authentication     bytea,
  refresh_token      varchar(255)
);

-------------------------------------------------------------
-- structure for table "oauth_refresh_token"
-------------------------------------------------------------
drop table if exists oauth_refresh_token;
create table oauth_refresh_token (
  create_time    timestamp default now(),
  token_id       varchar(255),
  token          bytea,
  authentication bytea
);