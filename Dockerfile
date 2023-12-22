FROM docker.io/library/ubuntu:18.04
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install openjdk-8-jdk wget
RUN mkdir /usr/local/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.84/bin/apache-tomcat-9.0.84.tar.gz /tmp/
RUN cd /tmp && tar -xvf apache-tomcat-9.0.84.tar.gz && cp -Rv apache-tomcat-9.0.84/* /usr/local/tomcat/
ADD **/*.war /usr/local/tomcat/webapps
EXPOSE 8090
CMD /usr/local/tomcat/bin/catalina.sh run
