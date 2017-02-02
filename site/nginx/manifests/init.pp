class nginx (
  String $package = $nginx::params::package,
  String $owner = $nginx::params::owner,
  String $group = $nginx::params::group,
  String $docroot = $nginx::params::docroot,
  String $confdir = $nginx::params::confdir,
  String $logdir = $nginx::params::logdir,
  String $user = $nginx::params::user,
  String $port = $nginx::params::port
) inherits nginx::params {
  File {
    owner => 'root',
    group => 'root',
    mode => '0664',
  }
  package { $package:
    ensure => latest,
  }
  file { [$docroot, "${confdir}/conf.d"]:
    ensure => directory,
  }
  file { 'default.conf':
    ensure => file,
    path => '/etc/nginx/conf.d/default.conf',
    content => epp('nginx/default.conf.epp', { root => $docroot, port => $port }),
    require => Package['nginx'],
  }
  file { 'nginx.conf':
    ensure => file,
    path => '/etc/nginx/nginx.conf',
    content => epp('nginx/nginx.conf.epp', {user => $user, confdir => $confdir, logdir => $logdir }),
    require => Package['nginx'],
  }
  file { 'docroot':
    ensure => directory,
    path => $root,
  }
  file { 'index.html':
    ensure => file,
    path => "${root}/index.html",
    source => 'puppet:///modules/nginx/index.html',
  }
  service { 'nginx':
    ensure => running,
    enable => true,
    subscribe => File['nginx.conf', 'default.conf'],
  }
}
