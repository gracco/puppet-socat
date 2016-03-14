define socat::profile (
  $port_listen,
  $address_bind,
  $port_bind,
) {

  file { '/etc/socat':
    ensure => "directory",
  }

  file {"/etc/socat/socat-${name}.conf":
      ensure  => present,
      content => template('socat/profile.conf.erb'),
      mode    => '0644',
      require => [Package['socat'], File['/etc/socat']]
  }

  service { "socat-${name}":
    ensure  => running,
    start   => "/usr/bin/socat -d -d -d -lf /var/log/socat-${name}.log TCP-LISTEN:${port_listen},fork TCP:${address_bind}:${port_bind} &",
    pattern => "/usr/bin/socat",
  }
}
