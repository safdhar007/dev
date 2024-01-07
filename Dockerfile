FROM docker.io/library/ubuntu:18.04
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install openjdk-8-jdk wget
RUN mkdir /usr/local/tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.84/bin/apache-tomcat-9.0.84.tar.gz  -O /tmp/apache-tomcat-9.0.84.tar.gz
RUN cd /tmp &&  tar xvfz apache-tomcat-9.0.84.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.84/* /usr/local/tomcat/
ADD **/*.war /usr/local/tomcat/webapps
EXPOSE 8090
CMD /usr/local/tomcat/bin/catalina.sh run

