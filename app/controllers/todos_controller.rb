class TodosController < ApplicationController
<<<<<<< HEAD
=======
  before_action :set_user
>>>>>>> 9f275a8f6da30ef12b85696d4b2b72c9681aaa91

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

<<<<<<< HEAD
=======
  def set_user
    @user = current_user
  end
>>>>>>> 9f275a8f6da30ef12b85696d4b2b72c9681aaa91
end