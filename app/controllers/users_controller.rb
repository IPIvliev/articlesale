class UsersController < ApplicationController
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
  end

  def index
    @copies = User.where(:role => "copy") 
  end
end
