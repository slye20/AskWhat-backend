class Comment < ApplicationRecord
  belongs_to :forum_thread
  belongs_to :user

  validates :content, presence: true, allow_blank: false
  validates :user_id, presence: true
  validates :forum_thread_id, presence: true
end
