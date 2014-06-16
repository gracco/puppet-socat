define socat::profile (
	$port_listen,
	$address_bind,
	$port_bind,
) {

	file {"/etc/socat/socat-${name}.conf":
    	ensure  => present,
    	content => template('socat/profile.conf.erb'),
    	mode    => '0644',
    	require => Package['socat'],
  }

    file {"/etc/init.d/socat-${name}":
      ensure  => file,
      content => template('socat/initscript.erb'),
      mode    => '0755',
    }

    service {"socat-${name}":
      hasrestart => true,
      hasstatus  => true,
      require    => File["/etc/init.d/socat-${name}"],
      ensure     => 'running',
      enable     => true,
    }
}
