IMAGE=brt/jenson-sample
VERSION=0.0.1

REGISTER=brt/binfmt-register:0.0.1

build:
	docker run --privileged ${REGISTER} set aarch64
	docker build -t ${IMAGE}:${VERSION} .
	docker run --privileged ${REGISTER} clear aarch64

push:
	docker tag ${IMAGE}:${VERSION} ${IMAGE}:${VERSION}
	docker push ${IMAGE}:${VERSION}

set:
	docker run --privileged ${REGISTER} set aarch64
	docker run --rm ${REGISTER} bin aarch64 > qemu-aarch64-static
	chmod +x qemu-aarch64-static

reset:
	docker run --privileged ${REGISTER} clear aarch64
	rm qemu-aarch64-static

test:
	docker run --rm -it -v ${PWD}/qemu-aarch64-static:/usr/bin/qemu-aarch64-static ${IMAGE}:${VERSION}

all: build set test reset