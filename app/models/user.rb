module Encryptor
  require 'digest'
  def self.encrypt(password)
    Digest::SHA1.hexdigest(password)
  end

  def self.salted(password, head = "123", tail = "xx")
    "#{head}#{password}#{tail}"
  end
end

class User < ApplicationRecord
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /.+\@.+\..+/ }

  validates :password, presence: true,
                       confirmation: true

  before_create :encrypt_password

  has_many :restaurants  # owner

  has_many :favorite_restaurants
  has_many :pocket_list, through: :favorite_restaurants,
                         source: :restaurant

  has_many :comments

  def self.login(params)
    email = params[:email]
    password = params[:password]

    salted_password = Encryptor.salted(password)
    encrypted_password = Encryptor.encrypt(salted_password)

    find_by(email: email, password: encrypted_password)
  end

  def like?(restaurant)
    pocket_list.exists?(restaurant.id)
  end

  private
  def encrypt_password
    salted_pwd = Encryptor.salted(password)
    self.password = Encryptor.encrypt(salted_pwd)
    # self.password = Digest::SHA1.hexdigest(password)
    # self.password=(Digest::SHA1.hexdigest(password))
    # password = Digest::SHA1.hexdigest(password)
  end
end
