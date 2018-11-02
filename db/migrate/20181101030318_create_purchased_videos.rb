class CreatePurchasedVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :purchased_videos do |t|

      t.timestamps
    end
  end
end
