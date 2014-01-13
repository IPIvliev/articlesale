class CopyrightersController < ApplicationController
  	before_filter :authenticate_user!

  def wait
  	@orders = Order.where(:status => 0)
  	@newpost = Post.new
  end

  def work
  	@posts = current_user.posts.where(:finish => false)
  end
end
