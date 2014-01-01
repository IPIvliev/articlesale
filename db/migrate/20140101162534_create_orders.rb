class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :keywords
      t.string :description
      t.integer :pictures
      t.integer :resolution
      t.string :file
      t.integer :amount
      t.datetime :finish_date
      t.integer :category_id
      t.integer :status

      t.timestamps
    end
  end
end
