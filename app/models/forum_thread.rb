class ForumThread < ApplicationRecord
    validates :title, presence: true
    validates :user_id, presence: true
    validates :category_id, presence: true

    belongs_to :user
    belongs_to :category
    has_many :posts

end
