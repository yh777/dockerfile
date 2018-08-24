FROM centos

RUN yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel javamail javassist tomcat-servlet && yum clean all && rm -rf /var/cache/yum/* && mkdir /sh
COPY start.sh /sh
RUN chmod +x /sh/start.sh
CMD [ "/sh/start.sh" ]
