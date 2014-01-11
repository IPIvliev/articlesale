class CopyrightersController < ApplicationController
  	before_filter :authenticate_user!

  def wait
  	@orders = Order.where(:status => 0)
  end
end
