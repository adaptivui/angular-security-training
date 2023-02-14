FROM openjdk:8-jre
WORKDIR /root/
COPY target/bookstore-0.0.1-SNAPSHOT.war .
EXPOSE 8080
CMD ["java","-jar","bookstore-0.0.1-SNAPSHOT.war"]
