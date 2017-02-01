class memcached {
package {'memcached':
  ensure => latest,
  }
  file {'/etc/sysconfig/memcached':
    ensure => file,
    source => 'puppet:///modules/memcached/memcached',
    require => Package['memcached'],
    }
  service {'memcached':
    ensure => running,
    enable => true,
    subscribe => File['/etc/sysconfig/memcached'],
    }
 }
