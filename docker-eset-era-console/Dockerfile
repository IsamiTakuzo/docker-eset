FROM tomcat:9-jdk17-corretto
#FROM tomcat:9-jre8-alpine

ENV ERA_SRV_HOSTNAME $ERA_SRV_HOSTNAME


RUN rm -rf /usr/local/tomcat/webapps/*
ADD ./era.war /usr/local/tomcat/webapps/era.war
ADD run.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/run.sh

EXPOSE 8080

CMD ["/usr/local/bin/run.sh"]
