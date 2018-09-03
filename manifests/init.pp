class thycotic {
  package { 'secret_server':
    ensure   => 'installed',
    provider => 'gem',
  }
}
