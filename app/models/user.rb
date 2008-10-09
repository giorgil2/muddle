require 'digest/sha1'

class User
  def self.default_repository_name
    :mysql
  end

  include DataMapper::Resource
  property :id, Serial, { :key => true, :nullable => true }
  property :email, String, { :format => :email_address, :nullable => false }
  attr_accessor :password
  property :crypted_password, String
  property :salt, String

  repository(:default) do
    has n, :posts
  end

  validates_with_method :password_valid?
  def password_valid?
    [
      self.password || (self.crypted_password && self.salt),
      'Password must not be blank'
    ]
  end

  before(:save) do
    return if password.blank?
    self.salt = Digest::SHA1.hexdigest([Time.now, (1..10).map { rand.to_s }].join('--')) if new_record?
    self.crypted_password = encrypt(self.password)
  end

  def authenticated?(password)
    self.crypted_password == encrypt(password)
  end

  def encrypt(password)
    self.class.encrypt(password, self.salt)
  end

  class << self

    def authenticate(email, password)
      user = User.first(:email => email)
      user && user.authenticated?(password) ? user : nil
    end

    def encrypt(password, salt)
      Digest::SHA1.hexdigest("--#{salt}--#{password}--")
    end

  end

end
