class User < ApplicationRecord
    has_many :forum_threads
    has_many :posts
end
