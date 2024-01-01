class RenameContentsToContentInForumThreads < ActiveRecord::Migration[7.1]
  def change
    rename_column :forum_threads, :contents, :content
  end
end
