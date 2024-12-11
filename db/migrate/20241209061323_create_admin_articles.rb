class CreateAdminArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :admin_articles do |t|
      t.string :title
      t.string :photo
      t.text :description

      t.timestamps
    end
  end
end
