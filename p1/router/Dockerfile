FROM frrouting/frr:latest

COPY ./vxlan.sh /vxlan.sh

RUN sed -i s/bgpd=no/bgpd=yes/g /etc/frr/daemons && \
    sed -i s/ospfd=no/ospfd=yes/g /etc/frr/daemons && \
    sed -i s/isisd=no/isisd=yes/g /etc/frr/daemons

CMD ["/usr/lib/frr/docker-start"]