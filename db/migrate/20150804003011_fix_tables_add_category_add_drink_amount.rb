class FixTablesAddCategoryAddDrinkAmount < ActiveRecord::Migration
  def change
    remove_column :rules, :category
    add_column :games, :category, :string
    add_column :rules, :drink, :string
  end
end
