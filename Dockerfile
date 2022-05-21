#
# Build stage
#
FROM maven:3.8-openjdk-11-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
# COPY mvnw /home/app
RUN mvn -f /home/app/pom.xml clean package

#
# Package stage
#
FROM openjdk:11-jre-slim
COPY --from=build /home/app/target/greeting-0.0.1-SNAPSHOT.jar /usr/local/lib/greeting.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/greeting.jar"]
