class ChangeColumnToVideo < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :price, :integer
    remove_column :videos, :key
    add_column :videos, :team1_id, :integer
    add_column :videos, :team2_id, :integer
    remove_column :videos, :team1
    remove_column :videos, :team2
  end
end
