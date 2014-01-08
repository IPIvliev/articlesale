class DiscussionsController < ApplicationController

	def index
		@discussions = Discussion.where("user_id = ? OR whom_id = ?", current_user, current_user)
	end

	def show
		@discussion = Discussion.find(params[:id])
		@message = Message.new
	end

  def create
    @user = User.find(params[:discussion][:whom_id])
    current_user.speak!(@user)
    redirect_to @user
  end

  def destroy
    @user = Discussion.find(params[:id]).whom
    current_user.unfollow!(@user)
    redirect_to @user
  end

  def newmessage
  	@message = current_user.messages.build(params[:message])
  	if @message.save
	  	@discussion = Discussion.find(params[:id])
	  	@oldamount = @discussion.amount
	  	@newamount = @oldamount + 1
	  	@discussion.update_attribute(:amount, @newamount)
  	end
  	redirect_to discussion_path(params[:id])
  end


end
