;
; Archivo de zona sub.granalmacen.com
;
$TTL    1m
@       IN      SOA     ns1.sub.granalmacen.com. admin.granalmacen.ib. (
                        2008052001 ; Serial
                        2m         ; Refresh (2 minutos)
                        1m         ; Retry (1 minuto)
                        1d         ; Expire (1 día)
                        1m )       ; Negative Cache TTL

; Servidores DNS de la Subzona (NS)
@       IN      NS      ns1.sub.granalmacen.com.
@       IN      NS      ns2.sub.granalmacen.com.

;  Registros de los Servidores DNS
ns1     IN      A       192.168.144.134  ; Servidor Primario
ns2     IN      A       192.168.144.135  ; Servidor Secundario

; Estaciones de Trabajo
pc1    IN      A       192.168.144.150
pc2    IN      A       192.168.144.151
pc3    IN      A       192.168.144.152
pc4    IN      A       192.168.144.153
pc5    IN      A       192.168.144.154