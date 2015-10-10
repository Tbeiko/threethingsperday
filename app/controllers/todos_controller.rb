class TodosController < ApplicationController
  before_action :set_user

  def index
  end

  def new
  	@todo = Todo.new
  end

  def create
  	@todo = Todo.new(post_params)
  	if @todo.save
      @user.todos << @todo
  		redirect_to user_path(current_user)
  	else
  	render :new
  	end
  end

  def show
  	@todos = current_user.todos.all
  end

  private
  def post_params
  	params.require(:todo).permit(:title, :description, :status) #description = reason of failure
  end

  def set_user
    @user = current_user
  end
end