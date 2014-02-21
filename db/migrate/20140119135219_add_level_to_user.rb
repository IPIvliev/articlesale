class AddLevelToUser < ActiveRecord::Migration
  def change
    add_column :users, :level, :float, :default => 0
    add_column :users, :pocket, :decimal, :precision => 6, :scale => 2
  end
end
