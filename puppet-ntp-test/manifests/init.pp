#2 Hier wird nur Default Wert festgelegt, Rest kommt aus example/init.pp (empfohlen oder hiera)
class hukntp ($server = ["pool.ntp.org"]) {

#1 class hukntp {

  #1 Array mit Werten, der in der Template Datei verwendet wird (fest im Code / nicht empfohlen)
  #1 $server = ["pool.ntp.org", "time.tu-berlin.de"]

 package { 'ntp':
   ensure => installed,
 }
 file { '/etc/ntp.conf':
   mode   => "0600",
   owner  => "root",
   group  => "root",
   content => template("hukntp/ntp.conf.erb"),
   notify => Service['ntpd'],
 }
 service { 'ntpd':
   enable => true,
   ensure => running,
 }

 Package['ntp'] -> File['/etc/ntp.conf'] -> Service['ntpd']

}

