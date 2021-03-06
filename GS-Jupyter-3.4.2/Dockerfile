
FROM jupyter/base-notebook:latest

LABEL Description="GemStone/S 64 Bit--Jupyter demo of Topaz kernel"
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
ENV GS_HOME=/home/$GS_USER \
	GEMSTONE=$GEMSTONE_GLOBAL_DIR/product
ENV	PATH=$GEMSTONE/bin:$PATH \
	GEMSTONE_EXE_CONF=$GEMSTONE_GLOBAL_DIR/conf \
	GEMSTONE_SYS_CONF=$GEMSTONE_GLOBAL_DIR/conf \
	GEMSTONE_NRS_ALL=#netldi:gs64ldi#dir:$GEMSTONE_GLOBAL_DIR/#log:$GEMSTONE_GLOBAL_DIR/log/%N_%P.log \
	GEMSTONE_LOGDIR=$GEMSTONE_GLOBAL_DIR/log \
	GEMSTONE_LOG=$GEMSTONE_GLOBAL_DIR/log/gs64stone.log \
	GS_FORCE_CLEAN_LOG_FILE_DELETE=true

RUN echo "auth required pam_wheel.so use_uid" >> /etc/pam.d/su && \
    useradd -m -s /bin/bash -N -u $GS_UID $GS_USER && \
    mkdir -p $GEMSTONE && \
    chown $GS_USER:$GS_GID $GEMSTONE_GLOBAL_DIR && \
    chmod g+w /etc/passwd

WORKDIR $GEMSTONE_GLOBAL_DIR

# it seems that the copy command does not recognize environment variables
# copy in order of least likely to change (and size)
COPY --chown=gemstone:users ./product/ ./product
COPY --chown=gemstone:users ./data/ ./data
COPY --chown=gemstone:users ./conf/ ./conf
COPY --chown=gemstone:users ./locks/ ./locks
COPY --chown=gemstone:users ./log/ ./log
COPY --chown=gemstone:users ./gemstone.sh ./gemstone.sh

WORKDIR $GS_HOME
USER $GS_USER
COPY --chown=gemstone:users ./topaz_kernel/ ./topaz_kernel
RUN /opt/conda/bin/python ./topaz_kernel/install.py
	
EXPOSE 8888
EXPOSE 50377
CMD ["/opt/gemstone/gemstone.sh"]

