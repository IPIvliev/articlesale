class Article < ActiveRecord::Base
  attr_accessible :image, :name, :text, :user_id

  mount_uploader :image, ArticleUploader
end
