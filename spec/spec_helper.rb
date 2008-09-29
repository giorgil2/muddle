require 'rubygems'
require 'merb-core'
require 'spec' # Satisfies Autotest and anyone else not using the Rake tasks

# this loads all plugins required in your init file so don't add them
# here again, Merb will do it for you
Merb.start_environment(:testing => true, :adapter => 'runner', :environment => ENV['MERB_ENV'] || 'test')
DataMapper.auto_migrate!

Spec::Runner.configure do |config|
  config.include(Merb::Test::ViewHelper)
  config.include(Merb::Test::RouteHelper)
  config.include(Merb::Test::ControllerHelper)
end

# Create methods, should result in valid objects from defaults
def create_user(options = {})
  default_options = { :email => 'email@email.email', :password => 'password' }
  options = default_options.merge!(options)
  record = User.new(options)
  record.save
  record
end

# Use to test error messages
def encode_message(message)
  "?_message=#{Merb::Request.escape([Marshal.dump(message)].pack("m"))}"
end