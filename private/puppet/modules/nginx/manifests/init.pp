class nginx {
	package { [ 'nginx' ]:
		ensure => installed,
		require => Exec['apt-get update'],
	}

	file { '/etc/nginx/nginx.conf':
		require => Package['nginx'],
		source => '/vagrant/private/config/nginx/nginx.conf'
	}

	file { 'nginx/sites-available':
		path => '/etc/nginx/sites-available',
		ensure => directory,
		owner => root,
		group => root,
		purge => true,
		recurse => true,
		source => "/vagrant/private/config/nginx/sites-available",
		require => Package['nginx'],
	}

	file { '/etc/nginx/sites-enabled/default':
		ensure => 'link',
		target => '/etc/nginx/sites-available/default',
		require => File['nginx/sites-available'],
		notify => Service['nginx'],
	}

	file { 'var/www':
		path => '/var/www',
		ensure => directory,
		owner => root,
		group => root,
		require => Package['nginx'],
	}

	service { 'nginx':
		ensure => running,
		enable => true,
		require => Package['nginx'],
	}
}