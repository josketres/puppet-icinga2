class repos::epel {

   File {
      owner => root,
      group => root,
      mode  => '0644',
   }

   case $::osfamily {

      'redhat': {
         file { 'RPM-GPG-KEY-EPEL':
            ensure => file,
            path   => "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${::operatingsystemmajrelease}",
            source => "puppet:///modules/repos/RPM-GPG-KEY-EPEL-${::operatingsystemmajrelease}",
         } ->

         yumrepo { 'epel':
            descr => "Extra Packages for Enterprise Linux ${::operatingsystemmajrelease} - \$basearch",
            mirrorlist => "https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=\$basearch",
            failovermethod => 'priority',
            enabled => '1',
            gpgcheck => '1',
            gpgkey => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${::operatingsystemmajrelease}",
         }

      } # RedHat
    
      default: {
         fail("Your operatingsystem ${::operatingsystem} is not supported.")
      }

   } # case
   
}
