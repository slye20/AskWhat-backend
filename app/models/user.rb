class User < ApplicationRecord
    has_many :forum_threads
    has_many :comments
    
    validates :username, presence: true, uniqueness: true, length: { minimum: 4 }
    validates :email, presence: true, uniqueness: true
    has_secure_password
    validates :password, length: { minimum: 4 }
end
