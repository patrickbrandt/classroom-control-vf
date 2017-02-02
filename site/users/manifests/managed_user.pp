define users::managed_user (
  $username = $title,
  $group = $title,
) {
  user { $username:
    ensure => present,
  }
  file { "/home/${username}":
    ensure => directory,
    owner => $username,
    group => $group,
  }
  group { $group:
    ensure => present,
  }
}
