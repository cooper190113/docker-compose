set sql_mode='';
set sql_mode='NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES';
create database if not exists `user-center` default character set = utf8mb4;
use `user-center`;

-- --------------------------------------------------------
-- structure for table "sys_user"
-- --------------------------------------------------------
drop table if exists `sys_user`;
create table `sys_user` (
  `user_id`    bigint(20) not null                  comment '用户ID',
  `username`   varchar(50) not null                 comment '登录账号',
  `password`   varchar(60) not null                 comment '密码',
  `nickname`   varchar(255) default null            comment '用户昵称',
  `image_url`  varchar(1024) default null           comment '头像路径',
  `phone`      varchar(11) default null             comment '手机号码',
  `sex`        tinyint(1) default null              comment '用户性别（0男 1女 2未知）',
  `enabled`    tinyint(1) not null default '1'      comment '帐号状态（0正常 1停用）',
  `type`       varchar(16) not null                 comment '用户类型（00系统用户）',
  `create_time` datetime                            comment '创建时间',
  `update_time` datetime                            comment '更新时间',
  primary key (`user_id`),
  unique key `username` (`username`) using btree
) engine=innodb default charset=utf8mb4;

--
-- data for table "sys_user"
--
INSERT INTO `sys_user` VALUES (1, 'bill', '$2a$10$ZZ7DSdUU408lm5N4Ewa3j.00mlDGt.zzWlg42f6Jne2CddAD8DaN2', 'administrator', '', '13106975707', 1, true, 'backend', '2019-10-15 16:56:59', '2019-10-15 03:12:44');

-- --------------------------------------------------------
-- Table structure for sys_role
-- --------------------------------------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id`         bigint(20)       NOT NULL         comment 'role ID',
  `code`            varchar(32)      NULL             comment 'role code',
  `name`            varchar(50)      NULL             comment 'role name',
  `create_time`     datetime                          comment 'create time',
  `update_time`     datetime                          comment 'update time',
  primary key (`role_id`)
)engine=innodb default charset=utf8mb4;

INSERT INTO `sys_role` VALUES (1, 'admin', 'administrator', '2019-10-15 16:56:59', '2019-10-15 16:56:59');

-- --------------------------------------------------------
-- Table structure for sys_user_role
-- --------------------------------------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id`         bigint(20)             NOT NULL             comment 'user ID',
  `role_id`         bigint(20)             NOT NULL             comment 'role ID'
)engine=innodb default charset=utf8mb4;

INSERT INTO `sys_user_role` VALUES (1, 1);

-- --------------------------------------------------------
-- Table structure for sys_permission
-- --------------------------------------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `permission_id`    bigint(20)       NOT NULL           comment 'permissionID',
  `permission`       varchar(50)      NULL               comment 'permission url',
  `name`             varchar(50)      NULL               comment 'permission name',
  `create_time`      datetime                            comment 'create time',
  `update_time`      datetime                            comment 'update time',
  primary key (`permission_id`)
)engine=innodb default charset=utf8mb4;

INSERT INTO `sys_permission` VALUES (100, 'system:user:view', 'View user ', '2019-10-15 17:12:00', '2019-10-15 17:12:05');
INSERT INTO `sys_permission` VALUES (101, 'system:user:list', 'Query users ', '2019-10-15 17:12:00', '2019-10-15 17:12:05');
INSERT INTO `sys_permission` VALUES (102, 'system:user:resetPassword', 'Reset user password ', '2019-10-15 17:12:00', '2019-10-15 17:12:05');
INSERT INTO `sys_permission` VALUES (103, 'system:user:updatePassword', 'Update user password ', '2019-10-15 17:12:00', '2019-10-15 17:12:05');
INSERT INTO `sys_permission` VALUES (104, 'system:user:insert', 'Add user', '2019-10-15 17:12:00', '2019-10-15 17:12:05');
INSERT INTO `sys_permission` VALUES (105, 'system:user:update', 'Update user', '2019-10-15 17:12:00', '2019-10-15 17:12:05');
INSERT INTO `sys_permission` VALUES (106, 'system:user:remove', 'Delete user', '2019-10-15 17:12:00', '2019-10-15 17:12:05');
INSERT INTO `sys_permission` VALUES (107, 'system:user:remove:list', 'Delete users in bulk', '2019-10-15 17:12:00', '2019-10-15 17:12:05');
INSERT INTO `sys_permission` VALUES (108, 'system:user:config:roles', 'Config user role', '2019-10-15 17:12:00', '2019-10-15 17:12:05');


-- --------------------------------------------------------
-- Table structure for sys_role_permission
-- --------------------------------------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `role_id`          bigint(20)             NOT NULL            comment 'role ID',
  `permission_id`    bigint(20)             NOT NULL            comment 'permission ID'
)engine=innodb default charset=utf8mb4;

INSERT INTO `sys_role_permission` VALUES (1, 100);
INSERT INTO `sys_role_permission` VALUES (1, 101);
INSERT INTO `sys_role_permission` VALUES (1, 102);
INSERT INTO `sys_role_permission` VALUES (1, 103);
INSERT INTO `sys_role_permission` VALUES (1, 104);
INSERT INTO `sys_role_permission` VALUES (1, 105);
INSERT INTO `sys_role_permission` VALUES (1, 106);
INSERT INTO `sys_role_permission` VALUES (1, 107);
INSERT INTO `sys_role_permission` VALUES (1, 108);

-- --------------------------------------------------------
-- Table structure for sys_menu
-- --------------------------------------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id`          bigint(20)       NOT NULL            comment 'menuID',
  `parent_id`        bigint(20)       NOT NULL            comment 'parent menuID',
  `name`             varchar(50)      NULL                comment 'menu name',
  `url`              varchar(1024)    NULL                comment 'url',
  `path`             varchar(1024)    NULL                comment 'static page path',
  `css`              varchar(32)      NULL                comment 'CSS',
  `sort`             int(10)          NULL                comment 'display order',
  `ismenu`           int(10)          NULL                comment 'whether the menu (1 yes 2 no)',
  `hidden`           int(10)          NULL                comment 'menu status (1 displayed 0 hidden)',
  `create_time`      datetime                             comment 'create time',
  `update_time`      datetime                             comment 'update time',
  primary key (`menu_id`)
)engine=innodb default charset=utf8mb4;

-- --------------------------------------------------------
-- Table structure for sys_role_permission
-- --------------------------------------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id`          bigint(20)             NOT NULL           comment 'role ID',
  `menu_id`          bigint(20)             NOT NULL           comment 'menu ID'
)engine=innodb default charset=utf8mb4;