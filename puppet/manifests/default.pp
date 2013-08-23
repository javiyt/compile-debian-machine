Exec
{
	path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ]
}

group
{
	'puppet':
		ensure => present,
}

package
{
	[ 'python', 'g++', 'make', 'checkinstall', 'devscripts', 'debhelper', 'dpkg-dev', 'cdbs', 'dh-buildinfo', 'openssl', 'pkg-config', 'build-essential', 'curl', 'zlib1g-dev', 'wget' ]:
		ensure => latest,
}