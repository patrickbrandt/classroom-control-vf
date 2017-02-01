class skeleton {
  file{ 'skel':
    ensure => directory,
    path => '/etc/skel',
  }
  file{ 'bashrc':
    ensure => file,
    path => '/etc/skel/.bashrc',
  }
}
