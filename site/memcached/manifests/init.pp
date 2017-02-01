class memcached {
  package{ 'memcached':
    ensure => latest, #wrong
  }
  
  file{ '/etc/sysconfig/memcached':
    ensure => present,
    source => 'puppet:///modules/memcached/memcached,
    requires => Package['memcached'],
  }
  
  service{ 'memcached':
    ensure => running,
    enable => true,
    requires => File['/etc/sysconfig/memcached'],
  }
}
