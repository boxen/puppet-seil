module Puppet::Parser::Functions
  newfunction(:expand_binding, :type => :rvalue) do |args|
    mappings = args[0]
    expanded = mappings.map do |k, v|
      ["enable_#{k}", 1, "keycode_#{k}", v]
    end
    Hash[*expanded.flatten]
  end
end
