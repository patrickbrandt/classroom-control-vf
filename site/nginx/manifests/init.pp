class nginx {
package { 'nginx':
  ensure => latest
}
file { 'conf.d':
  ensure => directory,
  path => '/etc/nginx/conf.d',
  owner => 'root',
  group => 'root',
  mode => '0775',
  }
file { 'default.conf':
  ensure => file,
  owner => 'root',
  group => 'root',
  mode => '0664',
  path => '/etc/nginx/conf.d/default.conf',
  source => 'puppet:///modules/nginx/default.conf',
  require => Package['nginx'],
}
file { 'nginx.conf':
  ensure => file,
  path => '/etc/nginx/conf.d/nginx.conf',
  source => 'puppet:///modules/nginx/nginx.conf',
  require => Package['nginx'],
}
file {'docroot':
  ensure => directory,
  path => '/var/www',
}
file {'/index.html':
  ensure => file,
  path => '/etc/nginx/conf.d/index.conf',
  source => 'puppet:///modules/nginx/index.conf',
  require => Package['nginx'],
}
service {'nginx'
  ensure => running,
  enable => true,
  subscribe => File['nginx.conf', 'default.conf'],
}
}
