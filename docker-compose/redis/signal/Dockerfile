#https://www.cnblogs.com/lonelyxmas/p/11719216.html
#https://blog.csdn.net/JackLiu16/article/details/79365878
#https://www.cnblogs.com/python-cat/p/10375978.html

# 集群
#https://github.com/tianheng2017/redis-sentinel.git
#https://github.com/MistRay/redis-docker-compose.git
#https://www.jianshu.com/p/61ce30d27625
#https://www.jb51.net/article/185223.htm
#https://www.cnblogs.com/DB-MYSQL/p/12490099.html
#https://www.cnblogs.com/zwcry/p/9156243.html
FROM redis:5.0

#修改时区
RUN echo "Asia/shanghai" > /etc/timezone;

RUN rm -rf /etc/localtime;
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN touch /data/redis.log
RUN chmod 777 /data/redis.log

#配置文件
COPY ./conf/ /usr/local/etc/

CMD [ "redis-server", "/usr/local/etc/redis.conf" ]
