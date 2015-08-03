class Rules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.text :rules
      t.string :category
    end
  end
end
