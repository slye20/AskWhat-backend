class User < ApplicationRecord
    has_many :forum_threads
    has_many :posts
    
    has_secure_password
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :username, length: { minimum: 4 }

end
