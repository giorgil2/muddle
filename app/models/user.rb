class User
  include DataMapper::Resource

  def self.default_repository_name
    :mysql
  end

  property :id, Serial, { :key => true, :nullable => true }
  property :email, String, { :format => :email_address, :nullable => false }

  has n, :posts, :repository => repository(:default)
end
