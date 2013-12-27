class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.string :text
      t.integer :user_id
      t.string :image

      t.timestamps
    end
  end
end
