class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.belongs_to :picture, index: true

      t.timestamps
    end
  end
end
