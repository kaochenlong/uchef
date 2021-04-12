require 'digest'

class User < ApplicationRecord
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /.+\@.+\..+/ }

  validates :password, presence: true,
                       confirmation: true

  before_create :encrypt_password

  def self.login(params)
    email = params[:email]
    password = params[:password]

    salted_password = salted(password)
    encrypted_password = encrypted(salted_password)

    find_by(email: email, password: encrypted_password)
  end

  private
  def encrypt_password
    salted_pwd = salted(password)
    self.password = encrypt(salted_pwd)
    # self.password = Digest::SHA1.hexdigest(password)
    # self.password=(Digest::SHA1.hexdigest(password))
    # password = Digest::SHA1.hexdigest(password)
  end

  def encrypt(password)
    Digest::SHA1.hexdigest(password)
  end

  def salted(password)
    "123#{password}xx"
  end
end
