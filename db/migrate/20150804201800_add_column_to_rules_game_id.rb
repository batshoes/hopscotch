class AddColumnToRulesGameId < ActiveRecord::Migration
  def change
    add_column :rules, :game_id, :integer
  end
end
