class skeleton{
file { '/etc/skel':
ensure => directory,
}
file {'/etc/skel/.bashrc':
ensure => file,
sorce => 'puppet://modules/skeleton/bashrc',
}
}
