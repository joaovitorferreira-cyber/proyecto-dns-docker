# Imatge base
FROM ubuntu:24.04

# Actualització i instal·lació de paquets necessaris
RUN apt-get update && apt-get install -y \
    bind9 \
    bind9-utils \
    bind9-doc \
    dnsutils \
    && rm -rf /var/lib/apt/lists/*

# Configuració per a IPv4
OPTIONS="-4 -u bind"

# Ports necessaris per al DNS
EXPOSE 53/tcp
EXPOSE 53/udp

# Comanda d'inici: Executar named en primer pla (-g) per evitar que el contenidor es tanqui
CMD ["/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf", "-u", "bind"]