# Docker for GemStone
This repository contains a framework and scripts to create a [Docker](https://www.docker.com/) image for [GemStone/S 64 Bit](https://gemtalksystems.com/products/gs64/) [Community Edition—Starter](https://gemtalksystems.com/licensing/) (see the GemStone [license](https://downloads.gemtalksystems.com/pub/GemStone_License_Agreement.pdf)). 

Note that this is configured for a maximum database of 8 GB and does *partial logging* with *no backups*, so while it might be useful for development, it should be treated primarily as a proof-of-concept to show that GemStone can be run in Docker.

After you have the Docker environment properly installed, try the following:

```
docker run --name gs342 -p 50377:50377 jgfoster/gs342
docker exec -it gs342 bash		# then topaz -l
docker stop gs342
docker start -a gs342
docker rm gs342		# remove container
docker rmi gs342	# remove image
```
For simplicity's sake, this container has the config files, the database, and the transaction logs inside the container. This makes a good demo of a throw-away playground, but it is not a "best practice" by any means. If you were to really run GemStone in a container, you should place these items outside and reference them from inside. To do so, copy the appropriate directories and create a "volume" link to them for the container:

```
cp -r gemstone/conf gemstone/data .
docker run -dit --rm --name gs342 -p 50377:50377 \
	-v /Users/jfoster/docker/GS-CE-Starter-3.4.2/data:/opt/gemstone/data \
	-v /Users/jfoster/docker/GS-CE-Starter-3.4.2/conf:/opt/gemstone/conf \
	jgfoster/gs342

```
This will remove the container when it is finished running, but the extent and tranlog will remain available outside the container.

See the [documentation](https://docs.docker.com/engine/reference/commandline/run/) for details on options for run, exec, start, stop, etc.

With a running container, you can use access the GemStone server using a GCI client (such as [Jade](https://github.com/jgfoster/Jade)).