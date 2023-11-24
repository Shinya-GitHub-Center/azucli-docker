FROM python:latest
ARG USERNAME=entra-user
ARG GROUPNAME=entra-user
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID $USERNAME
WORKDIR /home/entra-user
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y sudo vim less tree jq
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
WORKDIR /home/entra-user/workdir
