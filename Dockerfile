FROM ubuntu:24.04

# Instalar BIND9
RUN apt-get update && apt-get install -y \
    bind9 \
    bind9-utils \
    bind9-doc \
    dnsutils \
    && rm -rf /var/lib/apt/lists/*

# --- COPIAR ARCHIVOS ---
# 1. Copiamos la configuración a /etc/bind/
COPY config/ /etc/bind/

# 2. Copiamos las zonas a /var/lib/bind/ (donde apuntaste en named.conf.local)
COPY zones/ /var/lib/bind/

# --- PERMISOS ---
# Le damos propiedad al usuario 'bind' para que pueda leer los archivos
RUN chown -R bind:bind /etc/bind/ /var/lib/bind/ \
    && chmod -R 755 /var/lib/bind/

# Exponer puertos
EXPOSE 53/tcp
EXPOSE 53/udp

# Ejecutar BIND
CMD ["/usr/sbin/named", "-g", "-4", "-c", "/etc/bind/named.conf", "-u", "bind"]
