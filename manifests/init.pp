# Public: Installs Seil 10.9.0
#
# Usage:
#
#   include seil
class seil {
  include seil::config

  package { "Seil_${seil::config::version}":
    ensure   => installed,
    source   => $seil::config::dmg_url,
    provider => 'pkgdmg'
  }
}
