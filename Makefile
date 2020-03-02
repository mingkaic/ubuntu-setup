REPO=mkaichen

all: build_alpinepy build_bzl_ubuntu18 build_bzl_cpp

.PHONY=build_alpinepy
build_alpinepy:
	docker build -t mkaichen/alpinepy:latest -f Dockerfile.alpinepy .

.PHONY=build_bzl_ubuntu18
build_bzl_ubuntu18:
	docker build -t mkaichen/ubuntu-setup:bazel-ubuntu18 -f Dockerfile.ubuntu-18-bazel .

.PHONY=build_bzl_cpp
build_bzl_cpp: bazel_ubuntu18
	docker build -t mkaichen/bazel_cpp:latest -f Dockerfile.bazelcpp .

push: push_alpinepy push_bzl_ubuntu18 build_bzl_cpp

.PHONY=push_alpinepy
push_alpinepy:
	docker push mkaichen/alpinepy:latest

.PHONY=push_bzl_ubuntu18
push_bzl_ubuntu18:
	docker push mkaichen/ubuntu-setup:bazel-ubuntu18

.PHONY=build_bzl_cpp
build_bzl_cpp:
	docker push mkaichen/bazel_cpp:latest
