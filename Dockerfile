FROM ubuntu:16.04

RUN mkdir -p /tmp/ubuntu-setup
COPY . /tmp/ubuntu-setup
WORKDIR /tmp/ubuntu-setup
