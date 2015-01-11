# Public: call the commandline
#
# command = the command to pass to the commandline. Defaults to the title.
#
# Examples
#
#   # export configuration to file (output is a shell script)
#   seil::exec { 'export > ~/Desktop/seil-import.sh': }
#
#   # set the keycode for capslock to 80
#   seil::exec { 'set keycode_capslock 80': }
#
#   # don't execute unless keycode_capslock is already set to 80
#   seil::exec { 'set keycode_capslock 80':
#     unless => 'keycode_capslock 80'
#   }
#
#   # explicitly specify the commandline
#   seil::exec { 'foobar':
#     command => 'set keycode_capslock 80'
#   }
define seil::exec($command = $title, $unless = undef, $onlyif = undef) {
  include seil::config

  $unless_changed = $unless ? {
    undef   => undef,
    default => "${seil::config::cli} export | grep \"${unless}\""
  }

  $onlyif_changed = $onlyif ? {
    undef   => undef,
    default => "${seil::config::cli} export | grep \"${onlyif}\""
  }

  exec { "seil::exec ${command}":
    command => "${seil::config::cli} ${command}",
    require => Exec["launch seil${seil::config::version}"],
    unless  => $unless_changed,
    onlyif  => $onlyif_changed
  }
}
