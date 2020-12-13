FROM centos:latest

LABEL SampledemoprojectVersion="5.5.7.0" \
      contact="Bishwajeet" \
      application="Sampledemoapp" \
      base.image="centos"

RUN mkdir -p /opt/tomcat

#ADD jdk-8u201-linux-x64.rpm /jdk-8u201-linux-x64.rpm

#RUN rpm -Uvh jdk-8u201-linux-x64.rpm
RUN yum install -y java-1.8.0-openjdk

RUN yum install -y unzip \
    && yum install -y zip

ADD apache-tomcat-9.0.29.tar.gz /opt/tomcat

#ENV CATALINA_HOME /opt/tomcat/apache-tomcat-9.0.29

#ENV JAVA_HOME=/usr/java/latest

#ENV PATH $CATALINA_HOME/bin:$PATH

COPY Sampledemoproject.war /opt/tomcat/apache-tomcat-9.0.29/webapps

WORKDIR /opt/tomcat/apache-tomcat-9.0.29

EXPOSE 8080

ENTRYPOINT /opt/tomcat/apache-tomcat-9.0.29/bin/startup.sh && /bin/bash
