# based on https://container-solutions.com/tagging-docker-images-the-right-way/
NAME   := jgfoster/gs342
TAG    := $$(git log -1 --pretty=%H)
IMG    := ${NAME}:${TAG}
LATEST := ${NAME}:latest

bash:
	@docker run --rm --name gs342 -p 50377:50377 -it jgfoster/gs342 bash

build:
	./build.sh
	@docker build -f Dockerfile -t ${IMG} gemstone
	@docker tag ${IMG} ${LATEST}

clean:
	./tidy.sh

push:
	@docker push ${NAME}

run:
	@docker run --detach --name gs342 -p 50377:50377 jgfoster/gs342

runOnce:
	@docker run --detach --rm --name gs342 -p 50377:50377 jgfoster/gs342

stop:
	@docker stop gs342

tidy:
	./tidy.sh