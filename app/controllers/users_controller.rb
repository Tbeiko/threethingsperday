class UsersController < ApplicationController

  def new
    # redirect_to root_path if current_user
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    # @todos = current_user.todos.all 
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name)
  end

end