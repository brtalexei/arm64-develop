IMAGE=brt/jenson-sample-golang
VERSION=0.0.2

REGISTER=brt/binfmt-register:0.0.1

build:
	docker run --rm -v ${PWD}:/usr/src/hello -w /usr/src/hello -e GOOS=linux -e GOARCH=arm64 golang:1.9 go build -v

pack:
	docker run --privileged ${REGISTER} set aarch64
	docker build -t ${IMAGE}:${VERSION} .
	docker run --privileged ${REGISTER} clear aarch64

set:
	docker run --privileged ${REGISTER} set aarch64
	docker run --rm ${REGISTER} bin aarch64 > qemu-aarch64-static
	chmod +x qemu-aarch64-static

reset:
	docker run --privileged ${REGISTER} clear aarch64
	rm qemu-aarch64-static

run:
	docker run --rm -it -v ${PWD}/qemu-aarch64-static:/usr/bin/qemu-aarch64-static ${IMAGE}:${VERSION}

test: set run reset

clean:
	rm -f qemu-aarch64-static
	rm -f hello

all: build pack test