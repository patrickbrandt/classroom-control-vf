class profile::base {
  notify { "Hello, my name is ${::hostname}": }
  $msg = hiera($message)
  notify { "${msg}": }
}
