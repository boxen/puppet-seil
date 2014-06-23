# Public: Configures bindings for Seil
#
# Parameters:
#
#  mappings - a hash of mappings to set up. For instance: { 'control_l' => 80 }
define seil::bind($mappings) {
  include seil::config

  property_list_key { 'seil::bind':
    ensure     => 'present',
    path       => $seil::config::plist_path,
    key        => 'sysctl',
    value      => expand_binding($mappings),
    value_type => 'hash'
  }

  file { $seil::config::plist_path:
    owner   => $::boxen_user,
    require => Property_list_key['seil::bind']
  }
}
