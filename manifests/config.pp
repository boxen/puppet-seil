# configuration for seil
#
# $dmg_url - where to download the dmg
# $app - location of installed application
class seil::config {
  $version = '11.0.0'
  $base_url = 'https://pqrs.org/macosx/keyremap4macbook/files'
  $dmg_url = "${base_url}/Seil-${version}.dmg"
  $app = '/Applications/Seil.app'
  $cli = "${app}/Contents/Library/bin/seil"
}
