class Discussion < ActiveRecord::Base
  attr_accessible :user_id, :whom_id, :amount

  has_many :messages, dependent: :destroy

  belongs_to :user, class_name: "User"
  belongs_to :whom, class_name: "User"

  def speaker(current_user)
  	return whom.id if user == current_user
  	return user.id if user != current_user
  end

end