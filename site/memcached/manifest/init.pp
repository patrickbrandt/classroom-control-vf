class memcached {
package {'memcached':
  ensure => latest,
}

file {'memcached.conf'
ensure => file,
path => '/etc/sysconfig/memcached'
source => 'puppet:///modules/memcached/memcached',
require => Package ['memchached'],
}

service {'memcached':
ensure => running,
enabled => true,
subscribe => File['memcached.conf']
}
}
