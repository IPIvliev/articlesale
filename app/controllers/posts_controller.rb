class PostsController < ApplicationController

  before_filter :authenticate_user!
  
	def createpost
		@post = current_user.posts.build(params[:post])
		@post.save
		redirect_to "copyrighters/newpost.html"
	end

	def show
		@post = Post.find(params[:id])
	end


	def update
    	@post = Post.find(params[:id])

      	if @post.update_attributes(params[:post])
        	redirect_to @post, notice: 'Article was successfully updated.'
      	else
        	render "edit"
      	end
    end

  def edit_post_status
  	@post = Post.find(params[:id])

    if @post.finish == false
        origin = @post.proverka
        @post.update_attribute(:origin, origin["percent"])
    end

    @post.toggle!(:finish) if @post.origin > 75
    redirect_to @post, notice: 'Article was successfully updated.'
  end

  # Не используется
  def proverka
    @order = Order.find(params[:id])
    post = @order.post

    origin = post.proverka
    post.update_attribute(:origin, origin["percent"])
  end

end
