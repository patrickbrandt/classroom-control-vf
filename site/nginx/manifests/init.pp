class nginx {
	package { 'nginx':
		ensure => latest,
	}
	file { '/etc/nginx/conf.d':
		ensure  => directory,
		owner	=> 'root',
		group   => 'root',
		mode    => '0775',
	}
	file { '/var/www':
		ensure  => directory,
		owner	=> 'root',
		group   => 'root',
		mode    => '0775',
	}
	service { 'nginx':
		enable      => true,
		ensure      => running,
		subscribe	=> File['/etc/nginx/nginx.conf', '/etc/nginx/conf.d/default.conf']
	}
	file { '/etc/nginx/nginx.conf':
		ensure	=> file,
		source	=> 'puppet:///modules/nginx/nginx.conf',
		require => Package['nginx'],
		owner	=> 'root',
		group   => 'root',
		mode    => '0664',
	}
	file { '/etc/nginx/conf.d/default.conf':
		ensure	=> file,
		source	=> 'puppet:///modules/nginx/default.conf',
		require => Package['nginx'],
		owner	=> 'root',
		group   => 'root',
		mode    => '0664',
	}
	file { '/var/www/index.html': 
		ensure	=> file,
		source	=> 'puppet:///modules/nginx/index.html',
		require => Package['nginx'],
	}	
}