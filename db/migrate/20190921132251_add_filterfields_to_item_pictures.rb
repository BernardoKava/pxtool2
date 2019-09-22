class AddFilterfieldsToItemPictures < ActiveRecord::Migration[5.2]
  def change
    add_column :item_pictures, :b, :boolean
    add_column :item_pictures, :w, :boolean
  end
end
