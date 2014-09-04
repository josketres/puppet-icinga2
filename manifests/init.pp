class icinga2(
   $ensure  = running,
   $version = installed,
   $enable  = true,
   $constants = $params::constants,
) inherits icinga2::params {

   validate_re($ensure, '^(running|stopped)', 'ensure must be running or stopped')
   validate_hash($constants)
   validate_bool($enable)

   anchor { 'icinga2::begin':
      notify => Class['icinga2::service'],
   } ->

   class { 'icinga2::install': }
   class { 'icinga2::config': } ~>
   class { 'icinga2::service': } ->

   anchor { 'icinga2::end': }

}
