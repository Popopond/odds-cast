class AddPhotoToContents < ActiveRecord::Migration[8.0]
  def change
    add_column :contents, :photo, :string
  end
end
