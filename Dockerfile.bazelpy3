FROM ubuntu:16.04

RUN mkdir -p /tmp/setup/tools
RUN mkdir -p /tmp/setup/langs
COPY ./tools/bazel_setup.sh /tmp/setup/tools
COPY ./langs/gcc_setup.sh /tmp/setup/langs
COPY ./langs/java_setup.sh /tmp/setup/langs
COPY ./langs/python3_setup.sh /tmp/setup/langs
COPY ./utils /tmp/setup/utils

RUN bash /tmp/setup/tools/bazel_setup.sh
RUN bash /tmp/setup/langs/gcc_setup.sh
RUN bash /tmp/setup/langs/java_setup.sh
RUN bash /tmp/setup/langs/python3_setup.sh
