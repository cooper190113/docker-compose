#https://github.com/baojingyu/docker-mycat-mysql
#https://github.com/chendexiaqu/mysql_mycat.git
#https://www.cnblogs.com/ivictor/p/5131480.html
#https://github.com/dekuan/docker.mycat
#https://www.cnblogs.com/kingsonfu/p/10627802.html
#https://www.cnblogs.com/wggj/p/9994020.html
#https://blog.csdn.net/qq_28804275/article/details/80892093
#https://www.cnblogs.com/YingYue/p/7677814.html
#https://yq.aliyun.com/articles/46629
#http://www.dedecms.com/knowledge/data-base/mysql/2012/0819/8124.html
#https://www.jianshu.com/p/944e03095351 mysql 基于docker-compose配置主从复制（一主一从）
FROM java:8-jre

ENV mycat-version Mycat-server-1.6.5-release-20191127214730-linux.tar.gz
USER root
COPY ./Mycat-server-1.6.5-release-20191127214730-linux.tar.gz /
RUN tar -zxf /Mycat-server-1.6.5-release-20191127214730-linux.tar.gz
ENV MYCAT_HOME=/mycat
ENV PATH=$PATH:$MYCAT_HOME/bin
WORKDIR $MYCAT_HOME/bin
RUN chmod u+x ./mycat
ADD ./driver/ /mycat/lib/
EXPOSE 8066 9066
CMD ["./mycat","console"]