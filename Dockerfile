FROM maven:3.8.7-openjdk-11-slim AS build
WORKDIR /app
COPY pom.xml .
COPY pom.xml
COPY src ./src
RUN mvn clean package

FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/spring_boot_backend_template-0.0.1.jar  app.jar .
EXPOSE 8080
ENTRYPOINT  ["java", "-jar", "app.jar"]
