FROM openjdk:8-jre
WORKDIR /home/runner/work/angular-security-training/angular-security-training/pw/pw-jwt-oauth/server/
COPY target/bookstore-0.0.1-SNAPSHOT.war .
EXPOSE 8080
CMD ["java","-jar","bookstore-0.0.1-SNAPSHOT.war"]
