FROM maven:3.6.0-jdk-11-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn clean package -Dmaven.test.skip=true

#
# Package stage
#
FROM openjdk:11-jre-slim
RUN ls -R
#COPY --from=build /home/app/target/demo-0.0.1-SNAPSHOT.jar /usr/local/lib/demo.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/demo.jar"]