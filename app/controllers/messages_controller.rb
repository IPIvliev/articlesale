class MessagesController < ApplicationController

def index
	@messages = Message.all
	@lastmessage = Message.all.last
end
 
 def show
 	@message = Message.find(params[:id])
 end
end