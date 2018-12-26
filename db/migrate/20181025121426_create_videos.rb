class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :sport
      t.integer :team1_id
      t.integer :team2_id
      t.integer :contributor_id
      t.integer :price
      t.timestamps
    end
  end
end
