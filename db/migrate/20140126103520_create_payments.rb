class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
		t.integer :sender
		t.integer :receiver
		t.decimal :amount, :precision => 6, :scale => 2
		t.integer :type

      t.timestamps
    end
  end
end
