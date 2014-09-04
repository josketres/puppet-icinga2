class icinga2::install {

   if $module_name != $caller_module_name {
      fail("icinga2::install is a private define resource of module icinga2, you're not able to use.")
   }

   $version = $icinga2::version

   package { 'icinga2':
     ensure => $version,
   } ->

   # anchor for implecit dependencies config files
   file { '/etc/icinga2/conf.d':
      ensure => directory,
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
   }

}
