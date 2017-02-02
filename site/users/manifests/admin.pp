class users::admins {
  users::managed_user { 'iad': }
  users::managed_user { 'bob':
    username => 'bobdylan',
    group => 'musicians',
  }
}
