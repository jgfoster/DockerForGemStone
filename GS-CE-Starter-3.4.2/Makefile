# based on https://container-solutions.com/tagging-docker-images-the-right-way/
NAME   := jgfoster/gs342
TAG    := $$(git log -1 --pretty=%H)
IMG    := ${NAME}:${TAG}
LATEST := ${NAME}:latest
 
build:
	./build.sh
	@docker build -f Dockerfile -t ${IMG} gemstone
	@docker tag ${IMG} ${LATEST}
 
push:
	@docker push ${NAME}
