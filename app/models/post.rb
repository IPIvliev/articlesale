class Post < ActiveRecord::Base
  attr_accessible :category_id, :finish, :name, :order_id, :price, :text, :user_id
end
