# profile environment
FROM eclipse-temurin:17

VOLUME ["/app_log/test"]
LABEL project="test"

ADD ./build/libs/kopring-0.0.1-SNAPSHOT.jar test.jar
EXPOSE 9000
RUN sh -c 'touch /test.jar'
ENV JAVA_OPTS="-XX:MaxMetaspaceSize=2048m -XX:MetaspaceSize=1024m -Dserver.port=9000"
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./umvnrandom -Djava.net.preferIPv4Stack=true -jar test.jar"]