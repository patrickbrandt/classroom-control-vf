class skeleton {
  file{ 'skel':
    ensure => directory,
    path => '/etc/skel',
  }
  file{ 'bashrc':
    ensure => file,
    source => 'puppet:///modules/skeleton/bashrc',
    path => '/etc/skel/.bashrc',
  }
}
