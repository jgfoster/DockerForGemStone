
FROM jgfoster/gs342:latest

USER gemstone:users
WORKDIR /opt/gemstone
COPY --chown=gemstone:users ./gemstone.sh ./*.gs ./Jasper.sh /opt/gemstone/
COPY --chown=gemstone:users ./htdocs/ /opt/gemstone/htdocs
RUN echo 'set user DataCurator pass swordfish\nlogin\n' > .topazini
EXPOSE 8888
CMD ["/opt/gemstone/gemstone.sh"]
