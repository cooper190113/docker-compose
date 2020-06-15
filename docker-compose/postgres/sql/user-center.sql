create database "user-center";
\c user-center;

-- --------------------------------------------------------
-- Table structure for sys_user
-- --------------------------------------------------------
DROP TABLE IF EXISTS "sys_user";
CREATE TABLE "sys_user" (
  "user_id"         int8             NOT NULL,             --'user ID'
  "username"        varchar(50)      NULL,                 --'username'
  "password"        varchar(100)     NULL,                 --'password'
  "nickname"        varchar(255)     NULL,                 --'nickname'
  "image_url"       varchar(1024)    NULL,                 --'imageurl'
  "phone"           varchar(20)      NULL,                 --'phone'
  "sex"             int4             NULL,                 --'sex(0male 1female 2unknown)'
  "enabled"         bool             NOT NULL,             --'account status (true normal false disabled)'
  "type"            varchar(16)      NOT NULL,             --'user type (00 super administrator user, 01 system administrator user, 02 ordinary user)'
  "create_time"     timestamp,                             --'create time'
  "update_time"     timestamp,                             --'update time'
  CONSTRAINT sys_user_table_pkey PRIMARY KEY (user_id)
);

INSERT INTO "sys_user" VALUES (1, 'bill', '$2a$10$ZZ7DSdUU408lm5N4Ewa3j.00mlDGt.zzWlg42f6Jne2CddAD8DaN2', 'administrator', '', '13106975707', 1, true, 'backend', '2019-10-15 16:56:59', '2019-10-15 03:12:44');

-- --------------------------------------------------------
-- Table structure for sys_role
-- --------------------------------------------------------
DROP TABLE IF EXISTS "sys_role";
CREATE TABLE "sys_role" (
  "role_id"         int8             NOT NULL,             --'role ID'
  "code"            varchar(32)      NULL,                 --'role code'
  "name"            varchar(50)      NULL,                 --'role name'
  "create_time"     timestamp,                             --'create time'
  "update_time"     timestamp,                             --'update time'
  CONSTRAINT sys_role_table_pkey PRIMARY KEY (role_id)
);

INSERT INTO "sys_role" VALUES (1, 'admin', 'administrator', '2019-10-15 16:56:59', '2019-10-15 16:56:59');

-- --------------------------------------------------------
-- Table structure for sys_user_role
-- --------------------------------------------------------
DROP TABLE IF EXISTS "sys_user_role";
CREATE TABLE "sys_user_role" (
  "user_id"         int8             NOT NULL,             --'user ID'
  "role_id"         int8             NOT NULL              --'role ID'
);

INSERT INTO "sys_user_role" VALUES (1, 1);

-- --------------------------------------------------------
-- Table structure for sys_permission
-- --------------------------------------------------------
DROP TABLE IF EXISTS "sys_permission";
CREATE TABLE "sys_permission" (
  "permission_id"    int8             NOT NULL,            --'permissionID'
  "permission"       varchar(50)      NULL,                --'permission url'
  "name"             varchar(50)      NULL,                --'permission name'
  "create_time"      timestamp,                            --'create time'
  "update_time"      timestamp,                            --'update time'
  CONSTRAINT sys_permission_table_pkey PRIMARY KEY (permission_id)
);

INSERT INTO "sys_permission" VALUES (100, 'system:user:view', 'View user ', '2019-10-15 17:12:00', '2019-10-15 17:12:05');
INSERT INTO "sys_permission" VALUES (101, 'system:user:list', 'Query users ', '2019-10-15 17:12:00', '2019-10-15 17:12:05');
INSERT INTO "sys_permission" VALUES (102, 'system:user:resetPassword', 'Reset user password ', '2019-10-15 17:12:00', '2019-10-15 17:12:05');
INSERT INTO "sys_permission" VALUES (103, 'system:user:updatePassword', 'Update user password ', '2019-10-15 17:12:00', '2019-10-15 17:12:05');
INSERT INTO "sys_permission" VALUES (104, 'system:user:insert', 'Add user', '2019-10-15 17:12:00', '2019-10-15 17:12:05');
INSERT INTO "sys_permission" VALUES (105, 'system:user:update', 'Update user', '2019-10-15 17:12:00', '2019-10-15 17:12:05');
INSERT INTO "sys_permission" VALUES (106, 'system:user:remove', 'Delete user', '2019-10-15 17:12:00', '2019-10-15 17:12:05');
INSERT INTO "sys_permission" VALUES (107, 'system:user:remove:list', 'Delete users in bulk', '2019-10-15 17:12:00', '2019-10-15 17:12:05');
INSERT INTO "sys_permission" VALUES (108, 'system:user:config:roles', 'Config user role', '2019-10-15 17:12:00', '2019-10-15 17:12:05');


-- --------------------------------------------------------
-- Table structure for sys_role_permission
-- --------------------------------------------------------
DROP TABLE IF EXISTS "sys_role_permission";
CREATE TABLE "sys_role_permission" (
  "role_id"          int8             NOT NULL,            --'role ID'
  "permission_id"    int8             NOT NULL             --'permission ID'
);

INSERT INTO "sys_role_permission" VALUES (1, 100);
INSERT INTO "sys_role_permission" VALUES (1, 101);
INSERT INTO "sys_role_permission" VALUES (1, 102);
INSERT INTO "sys_role_permission" VALUES (1, 103);
INSERT INTO "sys_role_permission" VALUES (1, 104);
INSERT INTO "sys_role_permission" VALUES (1, 105);
INSERT INTO "sys_role_permission" VALUES (1, 106);
INSERT INTO "sys_role_permission" VALUES (1, 107);
INSERT INTO "sys_role_permission" VALUES (1, 108);

-- --------------------------------------------------------
-- Table structure for sys_menu
-- --------------------------------------------------------
DROP TABLE IF EXISTS "sys_menu";
CREATE TABLE "sys_menu" (
  "menu_id"          int8             NOT NULL,            --'menuID'
  "parent_id"        int8             NOT NULL,            --'parent menuID'
  "name"             varchar(50)      NULL,                --'menu name'
  "url"              varchar(1024)    NULL,                --'url'
  "path"             varchar(1024)    NULL,                --'static page path'
  "css"              varchar(32)      NULL,                --'CSS'
  "sort"             int4             NULL,                --'display order'
  "ismenu"           int4             NULL,                --'whether the menu (1 yes 2 no)'
  "hidden"           int4             NULL,                --'menu status (1 displayed 0 hidden)'
  "create_time"      timestamp,                            --'create_time'
  "update_time"      timestamp,                            --'update time'
  CONSTRAINT sys_menu_table_pkey PRIMARY KEY (menu_id)
);

-- --------------------------------------------------------
-- Table structure for sys_role_permission
-- --------------------------------------------------------
DROP TABLE IF EXISTS "sys_role_menu";
CREATE TABLE "sys_role_menu" (
  "role_id"          int8             NOT NULL,            --'role ID'
  "menu_id"          int8             NOT NULL             --'menu ID'
);