FROM ubuntu:16.04

RUN mkdir -p /tmp/msyscfg
COPY . /tmp/msyscfg
WORKDIR /tmp/msyscfg
