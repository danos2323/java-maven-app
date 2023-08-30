# Use the official Maven image to build the application
FROM maven:3.8.6-openjdk-11 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn -B -DskipTests clean package

# Use a lightweight Java image to run the application
FROM openjdk:11-jre-slim
ARG APP_VERSION
ENV APP_VERSION=${APP_VERSION}
WORKDIR /app
COPY --from=build /app/target/*.jar app-${APP_VERSION}.jar
CMD ["java", "-jar", "app.jar"]

