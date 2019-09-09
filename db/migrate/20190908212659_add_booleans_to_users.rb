class AddBooleansToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :boolean
    add_column :users, :explicit, :boolean
    add_column :users, :access_granted, :boolean
  end
end
