class RemoveTimeAddedFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :time_added, :time
  end
end
