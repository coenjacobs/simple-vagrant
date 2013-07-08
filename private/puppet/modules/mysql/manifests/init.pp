class mysql {
	$mysqlPassword = "root"

	package {  "mysql-server":
		ensure  => present,
		require => Exec['apt-get update'],
	}

	package { "mysql-client":
		ensure  => present,
		require => Package['mysql-server'],
	}

	service { "mysql":
		enable => true,
		ensure => running,
		require => Package["mysql-server"],
	}

	exec { "set-mysql-password":
		unless  => "mysqladmin -uroot -p$mysqlPassword status",
		command => "mysqladmin -uroot password $mysqlPassword",
		path    => "/bin:/usr/bin",
		require => Service["mysql"],
	}
}