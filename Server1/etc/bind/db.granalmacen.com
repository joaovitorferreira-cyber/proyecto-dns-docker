$ORIGIN .
$TTL 60 ; 1 minute
granalmacen.com         IN SOA  ns1.granalmacen.com. admin.granalmacen.com. (
                                2008052002 ; serial
                                120        ; refresh 
                                60         ; retry 
                                86400      ; expire 
                                60         ; minimum 
                                )
                        NS      ns1.granalmacen.com.
                        NS      ns2.granalmacen.org.
                        A       192.168.144.134
                        MX      10 mail1.granalmacen.com.
                        MX      20 mail2.granalmacen.com.
$ORIGIN granalmacen.com.
$TTL 600        ; 10 minutes
clientedns              A       192.168.144.150
                        DHCID   ( AAIBvPLtiDQXp3uIva1e/mDqTkN7VJXhVAaY11IekWQS
                                hfM= ) ; 2 1 32
$TTL 60 ; 1 minute
mail1                   A       192.168.144.134
mail2                   A       192.168.144.134
ns1                     A       192.168.144.134
sub                     NS      ns1.sub
                        NS      ns2.sub
$ORIGIN sub.granalmacen.com.
ns1                     A       192.168.144.134
ns2                     A       192.168.144.135
$ORIGIN granalmacen.com.
web                     CNAME   www
www                     A       192.168.144.134