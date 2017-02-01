class nginx {
  package { 'nginx':
  
  }
  file { 'default.conf':
  
  }
  file { 'nginx.conf':
  
  }
  file { 'docroot':
  
  }
  file { 'index.html':
  
  }
  service { 'nginx':
  
  }
}
