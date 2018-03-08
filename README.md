# arm64-develop

This repo is a collection of tools and samples to enable development for arm64v8 platform.

qemu-binfmt-aarch64 contains build procedure for container that enables QEMU user mode

build-sample-golang:

1. Uses golang container to run cross compilation of the code to arm64v8 binary
2. Packs binary to minimal arm64v8 container
3. Executes arm64v8 container using QEMU

build-sample-ros:

1. Sample how to initialize ROS workspace for arm64 development
2. Sample of ROS "hello world" module
3. How to call arm64 version of catkin_make using QEMU container
4. Run emulated ROS node (in progress)