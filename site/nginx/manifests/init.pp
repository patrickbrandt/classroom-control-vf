class nginx (
  String $root,
){
  File {
    owner => 'root',
    group => 'root',
    mode => '0664',
  }
  package { 'nginx':
    ensure => latest,
  }
  file { 'conf.d':
    ensure => directory,
    path => '/etc/nginx/conf.d',
  }
  file { 'default.conf':
    ensure => file,
    path => '/etc/nginx/conf.d/default.conf',
    source => 'puppet:///modules/nginx/default.conf',
    require => Package['nginx'],
  }
  file { 'nginx.conf':
    ensure => file,
    path => '/etc/nginx/nginx.conf',
    source => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
  }
  file { 'docroot':
    ensure => directory,
    path => '/var/www',
  }
  file { 'index.html':
    ensure => file,
    path => '/var/www/index.html',
    source => 'puppet:///modules/nginx/index.html',
  }
  service { 'nginx':
    ensure => running,
    enable => true,
    subscribe => File['nginx.conf', 'default.conf'],
  }
}
