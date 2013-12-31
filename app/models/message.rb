class Message < ActiveRecord::Base
  attr_accessible :read, :text, :user_id, :whom

  belongs_to :user
end
