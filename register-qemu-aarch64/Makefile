IMAGE=brt/binfmt-register
VERSION=0.0.1

all:
	docker build -t ${IMAGE}:${VERSION} .

push:
	docker tag ${IMAGE}:${VERSION} ${IMAGE}:${VERSION}
	docker push ${IMAGE}:${VERSION}

register:
	docker run --rm --privileged ${IMAGE}:${VERSION}
