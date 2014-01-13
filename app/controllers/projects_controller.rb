# encoding: utf-8

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
    @project = Project.find(params[:id])
    @order = Order.new

  end

  def destroy
    Project.find(params[:id]).destroy
    flash[:success] = "Сообщение уничтожено."
    redirect_to projects_path
  end

  def create_order
    @project = Project.find(params[:id])
    @order = @project.orders.build(params[:order])
    @order.save
    redirect_to project_path(params[:id])
  end

  def edit_status
    @order = Order.find(params[:id])
    @order.update_attribute(:status, params[:order][:status])
    render "projects/order/show"
  end

  def showorder
    @order = Order.find(params[:id])
    @post = @order.post
    @message = Message.new
    @user = @post.user if @post

    @newpost = Post.new

    render "projects/order/show"
  end

  def create_post
    @post = current_user.posts.build(params[:post])
    Order.find(params[:id]).update_attribute(:status, 2)
    @post.save
    redirect_to project_order_path(params[:id])
  end
end
