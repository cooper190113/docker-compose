-- 在主服务器上添加数据库用户
create user 'repl'@'%' identified with mysql_native_password by '123456';
grant all privileges on *.* to 'repl'@'%' with grant option;
flush privileges;