class CreateItemPictures < ActiveRecord::Migration[5.2]
  def change
    create_table :item_pictures do |t|
      t.string :name
      t.text :description
      t.string :author
      t.boolean :educational
      t.boolean :relevant
      t.boolean :q
      t.boolean :s
      t.text :notes
      t.string :picture
      t.boolean :explicit

      t.timestamps
    end
  end
end
