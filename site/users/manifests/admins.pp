class users::admins {
  users::managed_user { 'drew': }
  users::managed_user { 'bob':
    username => 'bobdylan',
    group => 'musicians',
  }
}
