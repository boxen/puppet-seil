module Puppet::Parser::Functions
  # transforms this:
  #
  # {
  #   'control_l' => 80,
  #   'capslock' => 50
  # }
  #
  # into this:
  #
  # {
  #   'control_l' => { 'value' => 80 },
  #   'capslock'  => { 'value' => 50 }
  # }
  newfunction(:expand_binding, :type => :rvalue) do |args|
    mappings = args[0]
    expanded = mappings.map do |k, v|
      [k, { 'value' => v }]
    end
    Hash[*expanded.flatten]
  end
end
