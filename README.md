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

See the [documentation](https://docs.docker.com/engine/reference/commandline/run/) for details on options for run, exec, start, stop, etc.

With a running container, you can use access the GemStone server using a GCI client (such as [Jade](https://github.com/jgfoster/Jade)).