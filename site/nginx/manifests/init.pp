class nginx {
  
  package { 'nginx':
    ensure => latest,
  }
  
  file { 'nginx.conf':
    ensure => file,
    path => '/etc/nginx/nginx.conf',
  }
}
