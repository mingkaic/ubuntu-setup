IMAGE_REPO := mkaichen
IMAGE_TAG := latest

all: build_bzl_ubuntu18 build_bzl_cpp # build_alpinepy

.PHONY: build_test_image
build_test_image:
	docker build -t ${IMAGE_REPO}/ubuntu-setup-test:${IMAGE_TAG} -f Dockerfile.test .

.PHONY: build_alpinepy
build_alpinepy:
	docker build -t ${IMAGE_REPO}/alpinepy:${IMAGE_TAG} -f Dockerfile.alpinepy .

.PHONY: build_bzl_ubuntu18
build_bzl_ubuntu18:
	docker build -t ${IMAGE_REPO}/bazel_ubuntu18:${IMAGE_TAG} -f Dockerfile.ubuntu-18-bazel .
	docker tag ${IMAGE_REPO}/bazel_ubuntu18:${IMAGE_TAG} ${IMAGE_REPO}/bazel_ubuntu18:latest

.PHONY: build_bzl_cpp
build_bzl_cpp: build_bzl_ubuntu18
	docker build -t ${IMAGE_REPO}/bazel_cpp:${IMAGE_TAG} -f Dockerfile.bazelcpp .

push: push_bzl_ubuntu18 push_bzl_cpp # push_alpinepy

.PHONY: push_test_image
push_test_image:
	docker push ${IMAGE_REPO}/ubuntu-setup-test:${IMAGE_TAG}

.PHONY: push_alpinepy
push_alpinepy:
	docker push ${IMAGE_REPO}/alpinepy:${IMAGE_TAG}

.PHONY: push_bzl_ubuntu18
push_bzl_ubuntu18:
	docker push ${IMAGE_REPO}/bazel_ubuntu18:${IMAGE_TAG}

.PHONY: push_bzl_cpp
push_bzl_cpp:
	docker push ${IMAGE_REPO}/bazel_cpp:${IMAGE_TAG}
