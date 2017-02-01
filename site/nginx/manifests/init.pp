class nginx {
  
  package { 'nginx':
    ensure => latest,
  }
  
  file { 'nginx.conf':
    ensure => file,
    path => '/etc/nginx/nginx.conf',
    source => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
  }
  
  file { 'default.conf':
    ensure => file,
    path => '/etc/nginx/conf.d/default.conf',
    source => 'puppet:///modules/nginx/default.conf',
    require => Package['nginx'],
  }
  
  file { 'docroot':
    ensure => directory,
    path => '/var/www',
    require => Package['nginx'],
  }
  
  file { 'index.html':
    ensure => file,
    path => '/var/www/index.html',
    source => 'puppet:///modules/nginx/index.html'
    require => File['docroot'],
  }
  
  service { 'nginx':
    ensure => running,
    enable => true,
    require => Package['nginx'],
    subscribe => File['nginx,conf', 'default.conf'],
  }
  
}
