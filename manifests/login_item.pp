# Public: sets up Seil to launch on login
#
# Will add a login item and launch the application.
#
# Usage:
#
#   include seil::login_item
#
# or to remove login-item:
#
#   class { 'seil::login_item':
#     ensure => 'absent'
#   }
#
# Parameters:
#
#   ensure - 'present' or 'absent'. Defaults to 'present'.
class seil::login_item($ensure = 'present') {
  include seil::config

  osx_login_item { 'Seil':
    ensure  => $ensure,
    path    => $seil::config::app,
    require => Package["Seil_${seil::config::version}"]
  }

  exec { "launch seil${seil::config::version}":
    command     => "/usr/bin/open ${seil::config::app}",
    refreshonly => true,
    subscribe   => Package["Seil_${seil::config::version}"],
    require     => Osx_login_item['Seil']
  }
}

