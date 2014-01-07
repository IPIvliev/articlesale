class ClientsController < ApplicationController
  	before_filter :authenticate_user!
  def home
  end

  def copy

  end  

  def complite
  	@orders = current_user.orders.where(:status => 4)
  end

  def wait
  	@orders = current_user.orders.where(:status => 0)
  end

  def work
  	@orders = current_user.orders.where(:status => 2)
  end

  def correct
  	@orders = current_user.orders.where(:status => 1)
  end

  def check
  	@orders = current_user.orders.where(:status => 3)
  end
end