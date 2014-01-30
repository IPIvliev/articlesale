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
    @post.toggle!(:finish)
    redirect_to @post
  end

end
