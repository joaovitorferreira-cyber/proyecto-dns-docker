$ORIGIN .
$TTL 60 ; 1 minute
granalmacen.com.        IN SOA  ns1.granalmacen.com. admin.granalmacen.com. (
                                2025120902 ; serial
                                120        ; refresh
                                60         ; retry
                                86400      ; expire
                                60         ; minimum
                                )
                        ; Nameservers de la zona
                        NS      ns1.granalmacen.com.
                        NS      ns2.granalmacen.org.  ; <--- ns2 es .org

                        ; Registros A y MX de la zona principal
                        A       172.16.8.8
                        MX      10 mail1.granalmacen.com.
                        MX      20 mail2.granalmacen.com.

$ORIGIN granalmacen.com.
$TTL 60 ; 1 minute
; --- Hosts Servidor 1 (172.16.8.8) ---
mail1                   A       172.16.8.8
mail2                   A       172.16.8.8
ns1                     A       172.16.8.8
www                     A       172.16.8.8
web                     CNAME   www

; --- Delegación de subdominio 'sub' ---
sub                     NS      ns1.sub.granalmacen.com.
sub                     NS      ns2.sub.granalmacen.org.

; --- Definición de la zona 'sub.granalmacen.com' ---
$ORIGIN sub.granalmacen.com.
; ns1.sub sigue siendo .com (local)
ns1                     A       172.16.8.8 
