class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :games, :rules
    remove_column :games, :category
  end
end
