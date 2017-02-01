class memcached {
	package { 'memcached':
		ensure => latest,
	}
	service { 'memcached':
		enable      => true,
		ensure      => running,
		subscribe 	=> File['/etc/sysconfig/memcached'],
	}
	file { '/etc/sysconfig/memcached':
		ensure  => file,
		source	=> 'puppet:///modules/memcached/config',
		require  => Package['memcached'],

	}
}