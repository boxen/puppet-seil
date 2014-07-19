# Public: set identifier to value
#
# identifier - the identifier to set. Defaults to title.
# value - the value to set.
#
# Examples
#
#   # set the capslock to 80
#   seil::set { 'capslock':
#     value => '80'
#   }
#
#   # explicitly specify the identifier
#   seil::set { 'foobar':
#     identifier => 'capslock',
#     value      => '80'
#   }
define seil::set(
  $value,
  $identifier = $title
) {

  seil::exec { "seil::set enable_${identifier} 1":
    command => "set enable_${identifier} 1",
    unless  => "set enable_${identifier} 1"
  }

  seil::exec { "seil::set keycode_${identifier} ${value}":
    command => "set keycode_${identifier} ${value}",
    unless  => "set keycode_${identifier} ${value}"
  }
}
