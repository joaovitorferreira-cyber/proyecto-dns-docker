$ORIGIN .
$TTL    1m
sub.granalmacen.com.    IN      SOA     ns1.sub.granalmacen.com. admin.granalmacen.com. (
                                        2025120901 ; Serial (Actualizado)
                                        2m         ; Refresh
                                        1m         ; Retry
                                        1d         ; Expire
                                        1m )       ; Negative Cache TTL

; --- Servidores DNS de la Subzona (NS) ---
                        IN      NS      ns1.sub.granalmacen.com.
                        IN      NS      ns2.sub.granalmacen.org.

$ORIGIN sub.granalmacen.com.
; --- Registros de los Servidores DNS ---
ns1     IN      A       172.16.8.8      ; Servidor 1 (Local)

; --- Estaciones de Trabajo (Dentro de la red /26) ---
; El rango válido es .1 a .62. Las antiguas (.150) quedaban fuera.
pc1     IN      A       172.16.8.50
pc2     IN      A       172.16.8.51
pc3     IN      A       172.16.8.52
pc4     IN      A       172.16.8.53
pc5     IN      A       172.16.8.54