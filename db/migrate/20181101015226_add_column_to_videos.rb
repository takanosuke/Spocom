class AddColumnToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :title, :string
    add_column :videos, :sport, :string
    add_column :videos, :team1, :string
    add_column :videos, :team2, :string
    add_column :videos, :key, :string
    add_column :videos, :contributor_id, :integer

  end
end
