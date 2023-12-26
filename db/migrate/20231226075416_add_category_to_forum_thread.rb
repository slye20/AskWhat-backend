class AddCategoryToForumThread < ActiveRecord::Migration[7.1]
  def change
    add_reference :forum_threads, :category, null: false, foreign_key: true
  end
end
