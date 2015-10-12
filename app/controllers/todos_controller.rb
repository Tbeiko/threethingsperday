class TodosController < ApplicationController
  before_action :set_user

  def index
  end

  def new
  	@todo = Todo.new
  end

  def create
  	@todo = Todo.new(todo_params)
    @todo.update_attributes!(created_at: Time.now )
  	if @todo.save
      @user.todos << @todo
  		redirect_to user_path(current_user)
  	else
  	render :new
  	end
  end

  def edit
    @todo = Todo.find(params[:id])
    @todo.update_attributes!(status: params[:status])
    if @todo.status == "completed" || @todo.status == "failed"
    end
    redirect_to user_path(current_user)
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update_attributes!(description: params[:todo][:description])
    redirect_to user_path(current_user)
  end

  def show
  	@todos = current_user.todos.all
  end

  private
  def todo_params
  	params.require(:todo).permit(:title, :description, :status, :created_at) # description = reason of failure
  end

  def set_user
    @user = current_user
  end
end