FROM centos

MAINTAINER Chandresh

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat

RUN curl -O https://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.50/bin/apache-tomcat-8.5.50.tar.gz 

RUN tar xvfz apache*.tar.gz

RUN mv apache-tomcat-8.5.50/* /opt/tomcat/.

RUN yum -y install java

RUN java -version

WORKDIR /opt/tomcat/webapps/

RUN curl -0 http://ftp-chi.osuosl.org/pub/jenkins/war-stable/2.204.1/jenkins.war

RUN COPY jenkins.war /opt/tomcat/webapps/

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
