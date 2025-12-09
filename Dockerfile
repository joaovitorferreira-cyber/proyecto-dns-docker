FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    bind9 \
    bind9-utils \
    bind9-doc \
    dnsutils \
    && rm -rf /var/lib/apt/lists/*

# Exposem ports
EXPOSE 53/tcp
EXPOSE 53/udp

# ARREGLADO: Ponemos las opciones directamente en el comando final
# -g: Run in foreground (necesario para Docker)
# -4: Solo IPv4
# -u bind: Usuario bind
CMD ["/usr/sbin/named", "-g", "-4", "-c", "/etc/bind/named.conf", "-u", "bind"]