FROM centos7

MAINTAINER sarath chandra <chennarao.py@gmail.com>

EXPOSE 8080

ENV JAVA_VER=1.8.0

RUN yum install -y wget \
        yum install -y java-1.8.0-openjdk-headless \
        yum clean all

RUN mkdir /springbootcicd        

# Add jar file from jenkins workspace or from S3/Artifactory

ADD docker.jar /springbootcicd

WORKDIR /springbootcicd

RUN chown -R 1001:1001 /springbootcicd

USER 1001

#RUN bash -c "touch /projectname//projectname-1.0.jar"

#ENTRYPOINT exec java $JAVA_OPTS -jar /projectname//projectname-1.0.jar


CMD ["java","-jar","/springbootcicd.jar"]
#
