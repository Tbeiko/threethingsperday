class TodosController < ApplicationController
  def index
  end

  def new
  	@post = Todo.new
  end

  def create
  	@post = Todo.new(post_params)
  	if @post.save
  		redirect_to 'post/show'
  	else
  	render :new
  	end
  end

  def show
  	@posts = current_user.posts.all
  end

  private
  def post_params
  	params.require(:post).permit(:title, :description, :status) #description = failure description
  end

end