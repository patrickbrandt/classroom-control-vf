class profile::base {
  $message = hiera('message', "Hello, welcome to ${::fqdn}!")
  notify { $message: }
}
