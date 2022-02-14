IMAGE_REPO := mkaichen
IMAGE_TAG := latest

all: build_all push_all

.PHONY: build_all
build_all: build_test_image build_bzl_ubuntu18 build_bzl_cpp build_conan #build_alpinepy

.PHONY: build_test_image
build_test_image:
	docker build -t ${IMAGE_REPO}/ubuntu-setup-test:${IMAGE_TAG} -f docker/Dockerfile.test .

.PHONY: build_alpinepy
build_alpinepy:
	docker build -t ${IMAGE_REPO}/alpinepy:${IMAGE_TAG} -f docker/Dockerfile.alpinepy .

.PHONY: build_bzl_ubuntu18
build_bzl_ubuntu18:
	docker build -t ${IMAGE_REPO}/bazel_ubuntu18:${IMAGE_TAG} -f docker/Dockerfile.ubuntu-18-bazel .
	docker tag ${IMAGE_REPO}/bazel_ubuntu18:${IMAGE_TAG} ${IMAGE_REPO}/bazel_ubuntu18:latest

.PHONY: build_bzl_cpp
build_bzl_cpp: build_bzl_ubuntu18
	docker build -t ${IMAGE_REPO}/bazel_cpp:${IMAGE_TAG} -f docker/Dockerfile.bazelcpp .

.PHONY: build_conan
build_conan:
	docker build -t ${IMAGE_REPO}/bionic_conan_cmake:${IMAGE_TAG} -f docker/Dockerfile.conan .

.PHONY: test_image
test_image:
	docker run ${IMAGE_REPO}/ubuntu-setup-test:${IMAGE_TAG}

.PHONY: push_all
push_all: push_bzl_ubuntu18 push_bzl_cpp # push_alpinepy

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
