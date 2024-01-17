class CreateJoinTableCategoriesForumThreads < ActiveRecord::Migration[7.1]
  def change
    create_join_table :categories, :forum_threads do |t|
      t.index %i[category_id forum_thread_id]
      t.index %i[forum_thread_id category_id]
    end
  end
end
