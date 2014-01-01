class ProjectsController < ApplicationController
  def index
	@project = Project.new
  end

  def create
	@project = current_user.projects.build(params[:project])
	@project.save
	redirect_to "/projects"
  end

  def edit
  end

  def show
  end


end
