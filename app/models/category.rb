class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :orders
  has_many :posts
end
