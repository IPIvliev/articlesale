class AdminsController < ApplicationController
	before_filter :authenticate_user!

  def news
    @articles = Article.paginate(page: params[:page], :per_page => 20).order("created_at DESC")
    @newarticle = Article.new
  end
end
