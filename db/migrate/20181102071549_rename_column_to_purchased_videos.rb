class RenameColumnToPurchasedVideos < ActiveRecord::Migration[5.2]
  def change
    rename_column :purchased_videos, :users_id, :user_id
    rename_column :purchased_videos, :videos_id, :video_id
  end
end
