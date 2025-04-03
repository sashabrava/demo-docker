FROM maven:3.8.6-eclipse-temurin-17 as builder

WORKDIR /app
COPY pom.xml .
COPY src src

RUN mvn clean package

FROM eclipse-temurin:17-jre-jammy

WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]