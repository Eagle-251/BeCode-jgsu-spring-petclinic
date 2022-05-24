FROM maven:3.8.5-jdk-11 AS BUILDER

RUN git clone https://github.com/Eagle-251/BeCode-jgsu-spring-petclinic.git /usr/src/petclinic
WORKDIR /usr/src/petclinic
RUN mvn package

FROM openjdk:11 
WORKDIR /opt/app
COPY --from=builder /usr/src/petclinic/target/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar .
CMD [ "java", "-jar", "spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar" ]

