class UsersController < ApplicationController
  before_filter :authenticate_user!

  def signup_client
  end

  def signup_copy
  end

    def facebook
  end

  def vkontakte
  end

  def show
  	@user = User.find(params[:id])
    @message = Message.new
  end

  def index
    @copies = User.where(:role => "copy") 
  end
end
