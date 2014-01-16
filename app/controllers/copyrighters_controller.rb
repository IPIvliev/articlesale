class CopyrightersController < ApplicationController
  	before_filter :authenticate_user!

  def wait
  	@orders = Order.where(:status => 0)
  	@newpost = Post.new
  end

  def work
  	@posts = current_user.posts.where(:finish => false)
  end

  def complite
  	@posts = current_user.posts.where(:finish => true)
  end

  def correct
    @posts = current_user.posts.where(:finish => true).orders
  end
end
