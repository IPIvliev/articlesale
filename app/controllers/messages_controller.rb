class MessagesController < ApplicationController

before_filter :authenticate_user!

def index
	@discussions = Discussion.where("user_id = ? OR whom = ?", current_user, current_user)

end
 
 def show
 	@message = Message.find(params[:id])

 end

 def new
 	#@message = Message.new
 end

 def create
 	#Message.create(:text => params[:message][:text], :whom => params[:message][:whom], :user_id => params[:message][:user_id])
 	redirect_to discussions_path
 end
end