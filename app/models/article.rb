class Article < ActiveRecord::Base
  attr_accessible :image, :name, :text, :user_id

  belongs_to :user

  mount_uploader :image, ArticleUploader
end
