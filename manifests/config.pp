# configuration for seil
#
# $dmg_url - where to download the dmg
# $app - location of installed application
# $plist_path - location of plist
class seil::config {
  $version = '10.9.0'
  $base_url = 'https://pqrs.org/macosx/keyremap4macbook/files'
  $dmg_url = "${base_url}/Seil-${version}.dmg"
  $app = '/Applications/Seil.app'
  $plist_path = "/Users/${::boxen_user}/Library/Preferences/org.pqrs.Seil.plist"
}
