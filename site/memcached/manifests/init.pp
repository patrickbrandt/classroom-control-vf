class memcached {
  package { 'memcached':
    ensure => latest,
  }
  file { 'memcached.conf':
    ensure => file,
    path => '/etc/sysconfig/memcached',
    source => 'puppet:///modules/memcached/memcached',
    require => Package['memcached'],
  }
  service { 'memcached':
    ensure => running,
    enable => true,
    subscribe => File['memcached.conf']
  }
}
