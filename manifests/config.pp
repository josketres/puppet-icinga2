class icinga2::config {

   if $module_name != $caller_module_name {
      fail("icinga2::config is a private define resource of module icinga2, you're not able to use.")
   }

   $constants = merge($params::constants, $icinga2::constants)

   File {
      owner => 'root',
      group => 'root',
      mode  => '0644',
   }

   file { '/etc/icinga2/constants.conf':
      ensure  => file,
      content => template('icinga2/constants.conf.erb'),
   }

}
