FROM gradle:8.1-jdk11 AS GradleBuilder

LABEL authors="koh"

ARG USER_NAME=gradle
ARG USER_UID=1000
ARG USER_GID=$USER_UID

USER $USER_NAME

WORKDIR /home/$USER_NAME

ENTRYPOINT [ "gradle", "build", "jar" ]
