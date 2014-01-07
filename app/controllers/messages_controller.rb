class MessagesController < ApplicationController

def index
	@messages = Message.all
	@lastmessage = Message.all.last
end
 
 def show
 	@message = Message.find(params[:id])
 end

 def create
 	Message.create(:text => params[:message][:text], :whom => params[:message][:whom], :user_id => params[:message][:user_id])
 	redirect_to messages_path
 end
end