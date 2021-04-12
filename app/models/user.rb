require 'digest'

class User < ApplicationRecord
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /.+\@.+\..+/ }

  validates :password, presence: true,
                       confirmation: true

  before_create :encrypt_password

  private
  def encrypt_password
    self.password = Digest::SHA1.hexdigest(salted_pwd)
    # self.password = Digest::SHA1.hexdigest(password)
    # self.password=(Digest::SHA1.hexdigest(password))
    # password = Digest::SHA1.hexdigest(password)
  end

  def salted_pwd
    "123#{self.password}xx"
  end
end
