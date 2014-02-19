class AddOriginToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :origin, :integer, :default => 100
  end
end
