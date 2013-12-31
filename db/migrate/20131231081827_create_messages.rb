class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :whom
      t.string :text
      t.boolean :read

      t.timestamps
    end
  end
end
