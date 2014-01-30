class AdminsController < ApplicationController
	before_filter :authenticate_user!

  def news
    @articles = Article.paginate(page: params[:page], :per_page => 20).order("created_at DESC")
    @newarticle = Article.new
  end

  def questions
  	@questions = Question.paginate(page: params[:page], :per_page => 20).order("created_at DESC")
  end

  def new_question
  	@question = Question.create(params[:question])
  	if current_user
  		redirect_to current_user
  	else
  		redirect_to root_path
  	end
  end
end
