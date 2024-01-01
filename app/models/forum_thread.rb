class ForumThread < ApplicationRecord
    validates :title, presence: true, uniqueness: true, length: { minimum: 10 }
    validates :user_id, presence: true

    belongs_to :user
    has_and_belongs_to_many :category
    has_many :comments
    
end
