#1 Wenn Werte direkt in manifests/init.pp (nicht empfohlen) dann
#1 include hukntp

#2 Empfohlene Variante, wenn Class Parameter gesetzt ist in manifests/init.pp
class {'hukntp':
  server => ["pool.ntp.org", "de.pool.ntp.org" ]
}
