
# based on https://github.com/jupyter/docker-stacks/blob/master/base-notebook/Dockerfile
FROM ubuntu:18.04

LABEL Description="GemStone/S 64 Bit--Community Edition: Starter--3.4.2"
LABEL maintainer="James Foster <github@jgfoster.net>"

USER root

# comment out the following if on a slow connection (ESUG 2018)
# RUN apt-get update && apt-get -yq dist-upgrade \
#   && apt-get install -yq --no-install-recommends \
#      ca-certificates \
#      sudo \
#      locales \
#   && apt-get clean \
#   && rm -rf /var/lib/apt/lists/*
#  RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
#      locale-gen

# Configure environment
ENV SHELL=/bin/bash \
    NB_USER=gemstone \
    NB_UID=1000 \
    NB_GID=100 \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    GEMSTONE_GLOBAL_DIR=/opt/gemstone
ENV HOME=/home/$NB_USER \
	GEMSTONE=$GEMSTONE_GLOBAL_DIR/product
ENV	PATH=$GEMSTONE/bin:$PATH \
	GEMSTONE_EXE_CONF=$GEMSTONE_GLOBAL_DIR/conf \
	GEMSTONE_SYS_CONF=$GEMSTONE_GLOBAL_DIR/conf \
	GEMSTONE_NRS_ALL=#netldi:gs64ldi#dir:$GEMSTONE_GLOBAL_DIR/#log:$GEMSTONE_GLOBAL_DIR/log/%N_%P.log \
	GEMSTONE_LOGDIR=$GEMSTONE_GLOBAL_DIR/log \
	GEMSTONE_LOG=$GEMSTONE_GLOBAL_DIR/log/gs64stone.log \
	GS_FORCE_CLEAN_LOG_FILE_DELETE=true

RUN groupadd wheel -g 11 && \
    echo "auth required pam_wheel.so use_uid" >> /etc/pam.d/su && \
    useradd -m -s /bin/bash -N -u $NB_UID $NB_USER && \
    mkdir -p $GEMSTONE && \
    chown $NB_USER:$NB_GID $GEMSTONE_GLOBAL_DIR && \
    chmod g+w /etc/passwd

USER $NB_UID
WORKDIR $GEMSTONE_GLOBAL_DIR

# it seems that the copy command does not recognize environment variables
COPY --chown=gemstone:users ./ $GEMSTONE_GLOBAL_DIR

EXPOSE 50377
CMD ["./gemstone.sh"]
