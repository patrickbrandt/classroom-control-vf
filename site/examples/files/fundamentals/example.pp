file { '/etc/motd':
  ensure  => file,
  owner   => 'test1',
  group   => 'root',
  mode    => '0400',
  content => "Hey, Puppet is fun! And I am gonna figure it out\n",
}

package { 'cowsay':
  ensure   => present,
  provider => gem,
}
