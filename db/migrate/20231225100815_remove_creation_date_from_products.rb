class RemoveCreationDateFromProducts < ActiveRecord::Migration[7.1]
  def change
    remove_column :discussion_threads, :creation_date, :datetime
  end
end
