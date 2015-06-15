require 'bcrypt'

class User < ActiveRecord::Base
  
  before_save :encrypt_password

  attr_accessor :password

  def authenticate password
    if password_hash == BCrypt::Engine.hash_secret(password, password_salt)
      self
    else
      nil
    end
  end

  def password_salt
    self[:password_salt] ||= BCrypt::Engine.generate_salt
  end

  private

    def encrypt_password
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end

end
