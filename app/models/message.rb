class Message < ActiveRecord::Base
  attr_accessible :read, :text, :user_id, :whom, :discussion_id

  validates :text, :presence => true

  belongs_to :user
  belongs_to :discussion
end
