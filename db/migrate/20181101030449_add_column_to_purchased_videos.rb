class AddColumnToPurchasedVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :purchased_videos, :video_title, :string
    add_column :purchased_videos, :price, :integer
    add_reference :purchased_videos, :users, foreign_key: true
    add_reference :purchased_videos, :videos, foreign_key: true
  end
end