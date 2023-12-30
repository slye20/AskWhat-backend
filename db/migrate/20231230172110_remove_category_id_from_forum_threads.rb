class RemoveCategoryIdFromForumThreads < ActiveRecord::Migration[7.1]
  def change
    remove_column :forum_threads, :category_id, :bigint
  end
end
