class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.integer :amount
      t.integer :user_id
      t.integer :whom_id

      t.timestamps
    end

    add_column :messages, :discussion_id, :integer

    add_index :discussions, :user_id
    add_index :discussions, :whom_id
    add_index :discussions, [:user_id, :whom_id], unique: true
  end
end
