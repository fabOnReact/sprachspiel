Dir[File.join(Rails.root, 'lib', 'core_ext','action_dispatch', 'middleware','*.rb')].each {|l| require l}
Dir[File.join(Rails.root, 'lib', 'core_ext','*.rb')].each {|l| require l}