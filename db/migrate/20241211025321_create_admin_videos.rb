class CreateAdminVideos < ActiveRecord::Migration[8.0]
  def change
    create_table :admin_videos do |t|
      t.string :title
      t.text :description
      t.string :video_url
      t.string :cover

      t.timestamps
    end
  end
end
