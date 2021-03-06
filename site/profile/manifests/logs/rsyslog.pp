# This class installs and configures rsyslog
#
class profile::logs::rsyslog (
  Enum['present','absent'] $ensure                     = 'present',

  Variant[String[1],Undef] $config_dir_source          = undef,
  String                   $config_file_template       = '',
) {

  $options_default = {
  }
  $options_user=hiera_hash('profile::logs::rsyslog::options', {} )
  $options=merge($options_default,$options_user)

  ::tp::install { 'rsyslog':
    ensure => $ensure,
  }

  if $config_file_template != '' {
    ::tp::conf { 'rsyslog':
      ensure       => $ensure,
      template     => $config_file_template,
      options_hash => $options,
    }
  }

  ::tp::dir { 'rsyslog':
    ensure => $ensure,
    source => $config_dir_source,
  }

}

