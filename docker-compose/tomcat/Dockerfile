FROM tomcat:8.5.30

#修改时区
RUN echo "Asia/shanghai" > /etc/timezone;

RUN rm -rf /etc/localtime;
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

COPY ./conf/server.xml /usr/local/tomcat/conf/server.xml