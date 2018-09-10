# based on https://container-solutions.com/tagging-docker-images-the-right-way/
NAME   := jgfoster/gs-jupyter-342
TAG    := $$(git log -1 --pretty=%H)
IMG    := ${NAME}:${TAG}
LATEST := ${NAME}:latest

bash:
	@docker run --rm -it jgfoster/gs-jupyter-342 bash

build:
	./build.sh
	@docker build -f Dockerfile -t ${IMG} gemstone
	@docker tag ${IMG} ${LATEST}
 
push:
	@docker push ${NAME}

run:
	@docker run --detach --name jupyter -p 8888:8888 -p 50377:50377 jgfoster/gs-jupyter-342

runOnce:
	@docker run --detach --rm --name jupyter -p 8888:8888 -p 50377:50377 jgfoster/gs-jupyter-342

tidy:
	./tidy.sh
