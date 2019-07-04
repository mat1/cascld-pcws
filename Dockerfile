FROM maven:3-jdk-8-slim
COPY . /tmp/src
WORKDIR /tmp/src
RUN mvn package -DskipTests

FROM openjdk:8-jre
COPY --from=0 /tmp/src/target/pcws.jar pcws.jar
EXPOSE 8080
CMD ["java", "-jar", "pcws.jar"]
