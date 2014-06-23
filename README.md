# Seil Puppet Module for Boxen

**Note**: This module was previously known as `puppet-pckeyboardhack`. This is a renamed fork to
accomodate the name change as of `10.8.0`. The original can be found [here](https://github.com/boxen/puppet-pckeyboardhack).

[![Build Status](https://travis-ci.org/boxen/puppet-seil.svg?branch=master)](https://travis-ci.org/boxen/puppet-seil)

Installs [Seil](https://pqrs.org/macosx/keyremap4macbook/seil.html.en) on your Mac.

## Usage

```puppet
include seil

# add seil to login items:
include seil::login_item

# change the left control to F19:
seil::bind { 'keyboard bindings':
  mappings => { 'control_l' => 80 }
}
```

## Codes to use in mappings

The codes for the keys that can be used in the mappings are listed below.

To identify keys not listed below, run `defaults read org.pqrs.Seil.plist` and look for the corresponding key, ie. `enable_control_l` or `enable_capslock`. Note that the code you need excludes the `enable_` or `keycode_` portion, ie. just `control_l` or `capslock`.

### Caps Lock

* Caps Lock: `capslock`

### Other Keys

* Command_L: `command_l`
* Command_R: `command_r`
* Control_L: `control_l`
* Control_R: `control_r`
* Option_L: `option_l`
* Option_R: `option_r`
* Shift_L: `shift_l`
* Shift_R: `shift_r`
* Escape: `escape`
* Delete: `delete`
* Return: `return`
* Keypad Enter: `enter`

### Keys on Non-Apple Keyboards

* International 1 Key: `int1`
* International 2 Key: `int2`
* International 3 Key: `int3`
* International 4 Key: `int4`
* International 5 Key: `int5`
* International 6 Key: `int6`
* International 7 Key: `int7`
* International 8 Key: `int8`
* International 9 Key: `int9`
* LANG1 Key: `lang1`
* LANG2 Key: `lang2`
* LANG3 Key: `lang3`
* LANG4 Key: `lang4`
* LANG5 Key: `lang5`
* LANG6 Key: `lang6`
* LANG7 Key: `lang7`
* LANG8 Key: `lang8`
* LANG9 Key: `lang9`
* ADB Power Key: `adb_keyboard_power`
* Again Key: `again`
* Copy Key: `copy`
* Cut Key: `cut`
* Execute Key: `execute`
* Find Key: `find`
* Menu Key: `menu`
* Paste Key: `paste`
* Select Key: `select`
* Stop Key: `stop`
* Undo Key: `undo`

### For Japanese

* NFER Key on PC keyboard: `jis_nfer`
* XFER Key on PC keyboard: `jis_xfer`
* KATAKANA Key on PC keyboard: `jis_kana`

## Required Puppet Modules

* `boxen`
* `osx`
* `glarizza/puppet-property_list_key`

## Development

Write code. Run `script/cibuild` to test it. Check the `script`
directory for other useful tools.
