class AddAnotherPriceToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :price, :decimal
  end
end
