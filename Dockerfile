FROM openjdk:8-jre

LABEL version="0.0.1"
LABEL description="Example angular test webapp Docker Image"
LABEL maintainer="adaptivui"

# update packages, to reduce risk of vulnerabilities
RUN apt-get update && apt-get upgrade -y && apt-get autoclean -y && apt-get autoremove -y

# set a non privileged user to use when running this image
RUN groupadd -r mvnang && useradd -g mvnang -s /bin/bash -d /home/angular-security-training -m mvnang
USER mvnang
# set right (secure) folder permissions
RUN mkdir -p /home/angular-security-training/app && chown -R mvnang:mvnang /home/angular-security-training/app

WORKDIR /home/angular-security-training/app

# install dependencies here, for better reuse of layers
RUN mvn -B package -f pw/pw-jwt-oauth/server/pom.xml

COPY pw/pw-jwt-oauth/server/target/bookstore-0.0.1-SNAPSHOT.war .
EXPOSE 8080
CMD ["java","-jar","bookstore-0.0.1-SNAPSHOT.war"]
