# encoding: utf-8

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
    if current_user.role == "admin"
      @copies = User.all
    else
      @copies = User.where(:role => "copy") 
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Пользователь удалён."
    redirect_to users_path
  end
end
