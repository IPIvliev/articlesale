class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.string :text
      t.string :email

      t.timestamps
    end
  end
end
