stage { 'repos': } -> Stage['main'] -> stage { 'after': }

file { '/root/puppetcode/modules':
   ensure => directory,
   mode => '0755',
}

file { '/root/puppetcode/hiera.yaml':
   ensure => file,
   mode => '0644',
}

file { '/etc/puppet/modules':
   ensure => symlink,
   target => '/root/puppetcode/modules',
   force => true,
}

file { ['/etc/hiera.yaml','/etc/puppet/hiera.yaml']:
   ensure => symlink,
   target => '/root/puppetcode/hiera.yaml',
   force => true,
}

file { '/etc/puppet/puppet.conf':
   ensure => file,
   content => '[main]
logdir=/var/log/puppet
vardir=/var/lib/puppet
ssldir=/var/lib/puppet/ssl
rundir=/var/run/puppet
factpath=$vardir/lib/facter
templatedir=$confdir/templates
pluginsync = true
hiera_config = /root/puppetcode/hiera.yaml
manifest = /root/puppetcode/site.pp
modulepath = /root/puppetcode/modules',
}

file { '/etc/puppet/environments':
   ensure => directory,
   mode => '0755',
}

file { '/etc/puppet/environments/production':
   ensure => directory,
   mode => '0755',
}

file { '/etc/puppet/environments/production/hieradata':
   ensure => symlink,
   target => '/root/puppetcode/hieradata',
}

class { 'repos::debmon':
   stage => 'repos',
}

