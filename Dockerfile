FROM maven:3.6-jdk-8-alpine as maven_builder

COPY . /tmp/

WORKDIR /tmp/

RUN ["mvn", "package"]


FROM tomcat:8.5-jdk8-openjdk-slim

COPY --from=maven_builder /tmp/gameoflife-web/target/gameoflife.war /usr/local/tomcat/webapps

EXPOSE 8080