
all: bazel_alpinepy bazel_ubuntu18 bazel_cpp

.PHONY=bazel_alpinepy
bazel_alpinepy:
	docker build -t mkaichen/alpinepy:latest -f Dockerfile.alpinepy .

.PHONY=bazel_ubuntu18
bazel_ubuntu18:
	docker build -t mkaichen/ubuntu-setup:bazel-ubuntu18 -f Dockerfile.ubuntu-18-bazel .

.PHONY=bazel_cpp
bazel_cpp: bazel_ubuntu18
	docker build -t mkaichen/bazel_cpp:latest -f Dockerfile.bazelcpp .
