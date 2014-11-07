class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :feeling

      t.timestamps
    end
  end
end
