class nginx::params {
  case $::osfamily {
    'redhat', 'debian': {
      $package = 'nginx'
      $owner = 'root'
      $group = 'root'
      $docroot = '/var/www'
      $confdir = '/etc/nginx'
      $logdir = '/var/log/nginx'
    }
    'windows': {
      $package = 'nginx-service'
      $owner = 'Administrator'
      $group = 'Administrators'
      $docroot = 'C:/var/www'
      $confdir = 'C:/etc/nginx'
      $logdir = 'C:/var/log/nginx'
    }
    default: {
      fail("You can run ${module_name} here you jabroni")
    }
  }
  $user = $::osfamily ? {
    'redhat' => 'nginx',
    'debian' => 'www-data',
    'windows' => 'nobody'
  }
  $port = '80'
}
