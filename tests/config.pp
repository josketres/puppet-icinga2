include icinga2

file { '/etc/icinga2/conf.d/hosts/localhost/users.conf':
  ensure  => file,
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  content => '
object Service "users" {
  import "generic-service"

  host_name = "localhost"
  check_command = "users"
  vars.sla = "24x7"
}',
  notify  => Class['icinga2::service'],
}
