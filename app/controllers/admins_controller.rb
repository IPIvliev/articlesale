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

  def statistics
    hash = RestClient.get("http://www.content-watch.ru/public/api/", , :action => 'GET_BALANCE', :key => "gthFFbiIqkBYvRh")

    @plagiat = JSON.parse(hash)
    @result = @plagiat["balance"].to_f/@plagiat["tariff"].to_f
  end
end
