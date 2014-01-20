class AddLevelToUser < ActiveRecord::Migration
  def change
    add_column :users, :level, :integer
    add_column :users, :pocket, :decimal, :precision => 6, :scale => 2
  end
end
