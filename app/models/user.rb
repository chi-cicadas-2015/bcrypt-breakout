class User < ActiveRecord::Base

  has_many :sayings

  def password
    @password ||= BCrypt::Password.new(secure_password_thingy)
  end

  def password=(new_password)
    @raw_password = new_password
    @password = BCrypt::Password.create(new_password)
    self.secure_password_thingy = @password
  end


end


# Password.new() - takes an already encrypted version of the password
# Password.create() - takes a plaintext unencrypted string an encrypts it