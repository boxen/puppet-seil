# Public: Configures bindings for Seil
#
# Parameters:
#
#  mappings - a hash of mappings to set up. For instance: { 'control_l' => 80 }
define seil::bind($mappings) {
  include seil::config

  create_resources('seil::set', expand_binding($mappings))
}
