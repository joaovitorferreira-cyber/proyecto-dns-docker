# Proyecto DNS con Docker
Práctica de despliegue de servicio Bind9 en contenedor.

## Red
Configurado para la subred: 172.16.8.0/26

## Notas de instalación en LXC
Se ha realizado un downgrade de containerd.io a la versión 1.7.28 para compatibilidad con Proxmox.

# Proyecto Servidor DNS con Docker (BIND9)

Este proyecto despliega un entorno de servidores DNS (Maestro y Esclavo) utilizando Docker y Docker Compose. Está diseñado para funcionar dentro de contenedores LXC (Proxmox) con Ubuntu 24.04.

## Requisitos Previos y Solución de Problemas (LXC)

Si estás ejecutando este proyecto dentro de un contenedor **LXC en Proxmox**, es necesario aplicar las siguientes correcciones antes de empezar.

### 1. Fix de compatibilidad Docker en LXC
Debido a una incompatibilidad entre las versiones recientes de `containerd.io` y Docker en entornos LXC, se debe instalar una versión específica anterior para evitar el error `failed to create shim task`.

Ejecuta el siguiente comando **antes** de intentar levantar cualquier contenedor:

```bash
apt update && apt install containerd.io=1.7.28-1~ubuntu.24.04~noble -yy --allow-downgrades