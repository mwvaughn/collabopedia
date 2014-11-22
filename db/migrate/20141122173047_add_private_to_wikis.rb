class AddPrivateToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :private, :boolean
    add_index :wikis, :private
  
  end
end
