FROM ubuntu:18.04

RUN apt update \
    && apt install -y qflow

WORKDIR /workspace

ENTRYPOINT [ "qflow" ]