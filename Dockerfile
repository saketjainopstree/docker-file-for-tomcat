FROM ubuntu:14.04

RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository ppa:openjdk-r/ppa -y
RUN apt-get update
RUN apt-get  install openjdk-7-jdk -y


WORKDIR /tmp
RUN apt-get install  -y wget
RUN wget http://redrockdigimark.com/apachemirror/tomcat/tomcat-8/v8.5.20/bin/apache-tomcat-8.5.20.tar.gz
RUN tar xzfv apache-tomcat-*.tar.gz --directory=/opt
RUN mv /opt/apache-tomcat* /opt/tomcat8
WORKDIR /opt/tomcat8/webapps
RUN rm -rf *


ENV CATALINA_HOME /opt/tomcat8
ENV PATH $CATALINA_HOME/bin:$PATH
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64/
ENV PATH $JAVA_HOME/bin:$PATH

COPY Spring3HibernateApp.war /opt/tomcat8/webapps

#EXPOSE 3306
EXPOSE 8080

CMD ["/opt/tomcat8/bin/catalina.sh","run"]
