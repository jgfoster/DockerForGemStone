
FROM jupyter/base-notebook:latest

USER jovyan:users
RUN mkdir $HOME/gemstone
COPY --chown=jovyan:users ./product $HOME/gemstone/product
COPY --chown=jovyan:users ./data $HOME/gemstone/data
COPY --chown=jovyan:users ./conf $HOME/gemstone/conf
COPY --chown=jovyan:users ./locks $HOME/gemstone/locks
COPY --chown=jovyan:users ./log $HOME/gemstone/log
COPY --chown=jovyan:users ./topaz_kernel $HOME/gemstone/topaz_kernel
COPY --chown=jovyan:users ./gemstone.sh $HOME/gemstone/gemstone.sh

ENV GEMSTONE=$HOME/gemstone/product \
	PATH=$HOME/gemstone/product/bin:$PATH \
	GEMSTONE_EXE_CONF=$HOME/gemstone/conf \
	GEMSTONE_SYS_CONF=$HOME/gemstone/conf \
	GEMSTONE_NRS_ALL=#netldi:gs64ldi#dir:$HOME/gemstone/#log:$HOME/gemstone/log/%N_%P.log \
	GEMSTONE_LOGDIR=$HOME/gemstone/log \
	GEMSTONE_LOG=$HOME/gemstone/log/gs64stone.log \
	GEMSTONE_GLOBAL_DIR=$HOME/gemstone \
	GS_FORCE_CLEAN_LOG_FILE_DELETE=true

RUN chown jovyan:users $HOME/gemstone && \
	echo 'set user DataCurator pass swordfish' > .topazini && \
	mv $HOME/gemstone/topaz_kernel $HOME && \
	/opt/conda/bin/python $HOME/topaz_kernel/install.py

EXPOSE 8888
EXPOSE 50377
CMD ["/home/jovyan/gemstone/gemstone.sh"]
