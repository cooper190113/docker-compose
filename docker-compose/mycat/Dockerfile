#http://www.mycat.org.cn/ 官网
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
#https://github.com/docker-box/mysql-cluster 一键部署 https://www.jb51.net/article/148134.htm
#https://www.jianshu.com/p/40e8b7548f03
#https://www.cnblogs.com/myIvan/p/10164926.html
#https://www.jianshu.com/p/19cb0f16dea4
#https://blog.csdn.net/qq_28827635/article/details/103814407 postgres 基于docker-compose配置主从复制（一主一从）
FROM java:8-jre

ENV mycat-version Mycat-server-1.6.7.4-release-20200105164103-linux.tar.gz
USER root
COPY ./Mycat-server-1.6.7.4-release-20200105164103-linux.tar.gz /
RUN tar -zxf /Mycat-server-1.6.7.4-release-20200105164103-linux.tar.gz
ENV MYCAT_HOME=/mycat
ENV PATH=$PATH:$MYCAT_HOME/bin
WORKDIR $MYCAT_HOME/bin
RUN chmod u+x ./mycat
RUN rm /mycat/lib/mysql-connector-java-5.1.35.jar
ADD ./driver/ /mycat/lib/
EXPOSE 8066 9066
CMD ["./mycat","console"]