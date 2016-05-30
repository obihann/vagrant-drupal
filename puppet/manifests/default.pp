include php
include mysql::secure

class { 'mysql::restore':
  script        => '/vagrant/config/db.sql',
  require       => Class['mysql::secure'],
}

class { 'mysql::flush':
  require => Class['mysql::restore'],
}

package { 'php5-gd':
  ensure  => 'present',
  require => Package['php5']
}
