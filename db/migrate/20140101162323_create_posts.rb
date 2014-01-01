class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :text
      t.boolean :finish
      t.string :category_id
      t.integer :user_id
      t.float :price
      t.integer :order_id

      t.timestamps
    end
  end
end
