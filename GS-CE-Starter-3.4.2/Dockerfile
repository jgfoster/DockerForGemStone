# use an official Ubuntu image as a parent
FROM ubuntu:18.04

# https://medium.com/@mccode/processes-in-containers-should-not-run-as-root-2feae3f0df3b
RUN groupadd -g 999 gemstone && useradd -r -u 999 -g gemstone gemstone
COPY --chown=gemstone:gemstone gemstone/ /opt/gemstone/
COPY --chown=gemstone:gemstone GemStone64Bit3.4.2-x86_64.Linux/ /opt/gemstone/product/
USER gemstone:gemstone
WORKDIR /opt/gemstone

ENV GEMSTONE=/opt/gemstone/product \
	PATH=/opt/gemstone/product/bin:$PATH \
	GEMSTONE_EXE_CONF=/opt/gemstone/conf \
	GEMSTONE_SYS_CONF=/opt/gemstone/conf \
	GEMSTONE_NRS_ALL=#netldi:gs64ldi#dir:/opt/gemstone/#log:/opt/gemstone/log/%N_%P.log \
	GEMSTONE_LOGDIR=/opt/gemstone/log \
	GEMSTONE_LOG=/opt/gemstone/log/gs64stone.log \
	GEMSTONE_GLOBAL_DIR=/opt/gemstone \
	GS_FORCE_CLEAN_LOG_FILE_DELETE=true

LABEL Description="Basic development install of GemStone/S 64 Bit"
EXPOSE 50377
CMD ["/opt/gemstone/gemstone.sh"]
