class RemovePriceFromPictures < ActiveRecord::Migration
  def change
    remove_column :pictures, :price, :integer
  end
end
