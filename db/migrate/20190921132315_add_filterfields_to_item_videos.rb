class AddFilterfieldsToItemVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :item_videos, :b, :boolean
    add_column :item_videos, :w, :boolean
  end
end
