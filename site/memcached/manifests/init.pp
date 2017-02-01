class memcached {
  package{ 'memcached':
    present => yes, #wrong
  }
  
  file{ '/etc/sysconfig/memcached':
    ensure => present,
    source => ,
    requires => Package['memcached'],
  }
  
  service{ 'memcached':
    ensure => running,
    requires => File['/etc/sysconfig/memcached'],
  }
}
