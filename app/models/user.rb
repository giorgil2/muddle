require 'merb-auth-more/mixins/salted_user'

class User
  include Merb::Authentication::Mixins::SaltedUser
  include DataMapper::Resource

  def self.default_repository_name
    :mysql
  end

  property :id, Serial, { :key => true, :nullable => true }
  property :email, String, { :format => :email_address, :nullable => false }

  has n, :posts, :repository => repository(:default)
end
