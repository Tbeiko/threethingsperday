class TodosController < ApplicationController
  def index
  end

  def new
  	@todo = Todo.new
  end

  def create
  	@todo = Todo.new(post_params)
  	if @todo.save
  		redirect_to 'todo/show'
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

end