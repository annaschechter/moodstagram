class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :message
      t.time :time_added

      t.timestamps
    end
  end
end
