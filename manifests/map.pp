# Public: map identifier to value
#
# identifier - the identifier to map. Defaults to title.
# value - the value to map.
#
# Examples
#
#   # map the capslock to 80
#   seil::map { 'capslock':
#     value => '80'
#   }
#
#   # explicitly specify the identifier
#   seil::map { 'foobar':
#     identifier => 'capslock',
#     value      => '80'
#   }
define seil::map(
  $value,
  $identifier = $title
) {

  seil::exec { "seil::map enable_${identifier} 1":
    command => "set enable_${identifier} 1",
    unless  => "set enable_${identifier} 1"
  }

  seil::exec { "seil::map keycode_${identifier} ${value}":
    command => "set keycode_${identifier} ${value}",
    unless  => "set keycode_${identifier} ${value}"
  }
}
