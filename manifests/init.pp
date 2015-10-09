# Public: Installs Seil 11.3.0
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
