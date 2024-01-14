class ForumThread < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :category
    has_many :comments, dependent: :destroy
    
    validates :title, presence: true, uniqueness: true, length: 10..100, allow_blank: false
    validates :user_id, presence: true
end
