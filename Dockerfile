FROM maven:3.3-jdk-8 AS BUILDER

RUN git clone https://github.com/Eagle-251/BeCode-jgsu-spring-petclinic.git /usr/src/petclinic
WORKDIR /usr/src/petclinic
RUN mvn package
COPY target/*.jar ./

FROM java:8 
WORKDIR /opt/app
COPY --from=builder /usr/src/petclinic/*.jar ./
CMD [ "java", "-jar", "target/*.jar" ]


