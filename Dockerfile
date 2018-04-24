FROM ubuntu:16.04

RUN mkdir -P /tmp/msyscfg
COPY . /tmp/msyscfg
WORKDIR /tmp/msyscfg
