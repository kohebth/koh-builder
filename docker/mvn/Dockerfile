FROM maven:3-openjdk-11-slim AS MvnBuilder

LABEL authors="koh"

ARG USER_NAME=mvn
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid ${USER_GID} ${USER_NAME} \
    && useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USER_NAME}

USER $USER_NAME

WORKDIR /home/$USER_NAME

ENTRYPOINT ["mvn", "package"]
