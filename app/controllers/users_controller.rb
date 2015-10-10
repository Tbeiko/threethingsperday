class UsersController < ApplicationController

  def new
    redirect_to root_path if current_user
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to 'posts/show'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name)
  end

end