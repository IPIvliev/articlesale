class Article < ActiveRecord::Base
  attr_accessible :image, :name, :text, :user_id
end
