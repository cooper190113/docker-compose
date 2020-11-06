#https://github.com/mvptracy/dnmp
FROM mysql:8

ENV MYSQL_ROOT_PASSWORD 123456

#修改时区
RUN echo "Asia/shanghai" > /etc/timezone;

RUN rm -rf /etc/localtime;
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#配置文件
ADD ./mysql.conf.d/my.cnf /etc/mysql/mysql.conf.d
ADD ./sql/ /docker-entrypoint-initdb.d
