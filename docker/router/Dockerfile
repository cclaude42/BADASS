FROM frrouting/frr:latest

COPY ./static_vxlan.sh    /static_vxlan.sh
COPY ./dynamic_vxlan.sh   /dynamic_vxlan.sh
COPY ./rack_evpn.sh       /rack_evpn.sh
COPY ./spine_evpn.sh      /spine_evpn.sh

RUN sed -i s/bgpd=no/bgpd=yes/g /etc/frr/daemons && \
    sed -i s/ospfd=no/ospfd=yes/g /etc/frr/daemons && \
    sed -i s/isisd=no/isisd=yes/g /etc/frr/daemons

CMD ["/usr/lib/frr/docker-start"]
