class User < ApplicationRecord
  has_many :forum_threads
  has_many :comments

  validates :username, presence: true, uniqueness: true, length: { minimum: 4 }, allow_blank: false
  validates :email, presence: true, uniqueness: true, allow_blank: false
  has_secure_password
  validates :password, presence: true, length: { minimum: 4 }, allow_blank: false
end
