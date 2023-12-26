class RenameThreadIdToCategoryId < ActiveRecord::Migration[6.0]
  def change
    rename_column :forum_threads, :thread_id, :category_id
  end
end