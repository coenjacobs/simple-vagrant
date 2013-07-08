class php {
	package { [ 'php5', 'php5-mcrypt', 'php5-mysql', 'php5-cli', 'php5-curl', 'php5-fpm' ]:
		require => Exec['apt-get update'],
		ensure => latest,
	}

	file { 'php.ini':
		path => '/etc/php5/fpm/php.ini',
		ensure => file,
		owner => root,
		group => root,
		source => '/vagrant/private/config/php/php.ini',
		require => Package['php5-fpm'],
		notify => Service['php5-fpm'],
	}

	file { 'www.conf':
		path => '/etc/php5/fpm/pool.d/www.conf',
		ensure => file,
		owner => root,
		group => root,
		source => '/vagrant/private/config/php/www.conf',
		require => Package['php5-fpm'],
		notify => Service['php5-fpm'],
	}

	service { 'php5-fpm':
		ensure => running,
		enable => true,
		require => Package['php5-fpm'],
	}
}