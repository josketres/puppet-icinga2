class icinga2::service {

   if $module_name != $caller_module_name {
      fail("icinga2::service is a private define resource of module icinga2, you're not able to use.")
   }

   $ensure = $icinga2::ensure
   $enable = $icinga2::enable

   service { 'icinga2':
     ensure => $ensure,
     enable => $enable,
   }

}
