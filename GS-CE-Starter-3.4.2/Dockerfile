
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
    GS_USER=gemstone \
    GS_UID=1001 \
    GS_GID=100 \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    GEMSTONE_GLOBAL_DIR=/opt/gemstone
ENV HOME=/home/$GS_USER \
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
    useradd -m -s /bin/bash -N -u $GS_UID $GS_USER && \
    mkdir -p $GEMSTONE && \
    chown $GS_USER:$GS_GID $GEMSTONE_GLOBAL_DIR && \
    chmod g+w /etc/passwd

USER $GS_UID
WORKDIR $GEMSTONE_GLOBAL_DIR

# copy in order of least likely to change (as well as size)
# it seems that the copy command does not recognize environment variables
COPY --chown=gemstone:users ./product $HOME/gemstone/product
COPY --chown=gemstone:users ./data $HOME/gemstone/data
COPY --chown=gemstone:users ./conf $HOME/gemstone/conf
COPY --chown=gemstone:users ./locks $HOME/gemstone/locks
COPY --chown=gemstone:users ./log $HOME/gemstone/log
COPY --chown=gemstone:users ./gemstone.sh $HOME/gemstone/gemstone.sh

EXPOSE 50377
CMD ["./gemstone.sh"]
