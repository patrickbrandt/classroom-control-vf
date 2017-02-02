class profile::base {
  if $message {
    notify { $message: }
  }
}
