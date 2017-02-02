class profile::base (
  $message = "Hello, welcome to ${::fqdn}!"
){
  notify { $message: }
}
