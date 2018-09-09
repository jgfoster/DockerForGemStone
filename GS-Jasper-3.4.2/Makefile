# based on https://container-solutions.com/tagging-docker-images-the-right-way/
NAME   := jgfoster/gs-jasper-342
TAG    := $$(git log -1 --pretty=%H)
IMG    := ${NAME}:${TAG}
LATEST := ${NAME}:latest

bash:
	@docker run --rm -it jgfoster/gs-jasper-342 bash

build:
	./build.sh
	@docker build -f Dockerfile -t ${IMG} gemstone
	@docker tag ${IMG} ${LATEST}
 
push:
	@docker push ${NAME}

run:
	@docker run --name jasper -p 8888:8888 -p 50377:50377 jgfoster/gs-jasper-342

runOnce:
	@docker run --rm --name jasper -p 8888:8888 -p 50377:50377 jgfoster/gs-jasper-342
