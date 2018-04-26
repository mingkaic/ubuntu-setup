FROM ubuntu:16.04

COPY . /tmp/setup
WORKDIR /tmp/setup

ENV SETUP_CFG /tmp/setup/configs
