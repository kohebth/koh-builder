FROM openjdk:11-oraclelinux8

ARG JAR_PATH

COPY ${JAR_PATH} /opt/app.jar
COPY docker/app/bin/app.sh /bin/app.sh

ENTRYPOINT [ "app.sh" ]
