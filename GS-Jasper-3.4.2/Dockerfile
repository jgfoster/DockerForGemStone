
FROM jgfoster/gs342:latest

USER gemstone:gemstone
WORKDIR /opt/gemstone
COPY --chown=gemstone:gemstone ./gemstone.sh ./*.gs ./Jasper.sh /opt/gemstone/
COPY --chown=gemstone:gemstone ./htdocs/ /opt/gemstone/htdocs
RUN echo 'set user DataCurator pass swordfish\nlogin\n' > .topazini
ENV HTDOCS=/opt/gemstone/htdocs
EXPOSE 8888
CMD ["/opt/gemstone/gemstone.sh"]
