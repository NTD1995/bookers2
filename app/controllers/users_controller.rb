class UsersController < ApplicationController
  def edit
        @user = User.find(params[:id])
  end

   def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)  
  end

  def index
    @book = Book.find(current_user.id)
    @users = User.all
    @user = User.new
  end

  def show
    @book = Book.new
    @user = User.find(params[:id]) 

  end

    private
  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end
end
