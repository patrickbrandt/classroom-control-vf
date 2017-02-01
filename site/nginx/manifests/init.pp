class nginx {
  
  package { 'nginx':
    ensure => latest,
  }
  
  file { 'nginx.conf':
    ensure => file,
    path => '/etc/nginx/nginx.conf',
    source => 'puppet:///modules/nginx/default.conf',
    requires => Package['nginx'],
  }
  
  file { 'default.conf':
    ensure => file,
    path => '/etc/nginx/conf.d/default.conf',
    source => 'puppet:///modules/nginx/default.conf',
    requires => Package['nginx'],
  }
  
  file { 'docroot':
    ensure => folder,
    path => '/var/www',
    requires => Package['nginx'],
  }
  
  service { 'nginx':
    ensure => running,
    enable => true,
    requires => Package['nginx'],
  }
}
