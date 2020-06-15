#https://www.jianshu.com/p/a445242cc4d2
#https://www.cnblogs.com/FRESHMANS/p/9488444.html
#https://www.jianshu.com/p/8228d261c6ff
#https://github.com/jiuli/nginx-tomcat-docker/blob/master/nginx/Dockerfile
#https://www.yiibai.com/docker/image_prune.html
#https://www.cnblogs.com/zjfjava/p/10909087.html
#https://www.cnblogs.com/miracle-luna/p/11111907.html
#https://mp.weixin.qq.com/s/bLXtsiQilsgBE98tnQsDFQ
#https://www.shuzhiduo.com/A/mo5k7gYM5w/
#https://www.cnblogs.com/bigberg/p/8516026.html
FROM nginx:1.19.0

#修改时区
RUN echo "Asia/shanghai" > /etc/timezone;

RUN rm -rf /etc/localtime;
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 删除默认的default.conf映射配置
RUN rm /etc/nginx/conf.d/default.conf
ADD nginx.conf /etc/nginx/nginx.conf
ADD ./conf.d/test.conf /etc/nginx/conf.d/test.conf
#COPY ./ssl/ /etc/nginx/ssl/