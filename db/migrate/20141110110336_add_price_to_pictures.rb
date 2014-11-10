class AddPriceToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :price, :integer
  end
end
