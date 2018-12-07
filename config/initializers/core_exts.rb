# Loading files in lib/core_ext/ActionDispatch/Middleware
Dir[File.join(Rails.root, 'lib', 'core_ext','action_dispatch', 'middleware','*.rb')].each {|l| require l}
# Loading files in lib/core_ext
Dir[File.join(Rails.root, 'lib', 'core_ext','*.rb')].each {|l| require l}