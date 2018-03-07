IMAGE=brt/binfmt-register
VERSION=0.0.1


build:
	docker build -t ${IMAGE}:${VERSION} .

push:
	docker tag ${IMAGE}:${VERSION} ${IMAGE}:${VERSION}
	docker push ${IMAGE}:${VERSION}

set:
	docker run --rm --privileged ${IMAGE}:${VERSION} set aarch64

reset:
	docker run --rm --privileged ${IMAGE}:${VERSION} clear aarch64

get:
	docker run --rm ${IMAGE}:${VERSION} bin aarch64 > qemu-aarch64-static
	chmod +x qemu-aarch64-static

hello: get
	docker run --rm -v ${PWD}/qemu-aarch64-static:/usr/bin/qemu-aarch64-static arm64v8/ubuntu uname -a
	rm qemu-aarch64-static

test: set hello reset

all: build test
