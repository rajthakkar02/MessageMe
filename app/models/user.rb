class User < ApplicationRecord
  has_many :messages
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 12 }
  validates :password, presence: true, length: { minimum: 6, maximum: 12 }
  has_secure_password
end
