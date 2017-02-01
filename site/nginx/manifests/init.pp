class nginx {
	File {
		owner	=> 'root',
		group   => 'root',
		mode    => '0664',
	}

	$nginx_conf = '/etc/nginx/nginx.conf'
	$default_conf = '/etc/nginx/conf.d/default.conf'
	
	package { 'nginx':
		ensure => latest,
	}
	file { '/etc/nginx/conf.d':
		ensure  => directory,
	}
	file { '/var/www':
		ensure  => directory,
	}
	service { 'nginx':
		enable      => true,
		ensure      => running,
		subscribe	=> File[$nginx_conf, $default_conf]
	}
	file { $nginx_conf:
		ensure	=> file,
		source	=> 'puppet:///modules/nginx/nginx.conf',
		require => Package['nginx'],
	}
	file { $default_conf:
		ensure	=> file,
		source	=> 'puppet:///modules/nginx/default.conf',
		require => Package['nginx'],
	}
	file { '/var/www/index.html': 
		ensure	=> file,
		source	=> 'puppet:///modules/nginx/index.html',
		require => Package['nginx'],
	}	
}