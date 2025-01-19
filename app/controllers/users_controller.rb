class UsersController < ApplicationController
  def edit
        @user = User.find(params[:id])
  end

   def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end 
  end

  def index
    @book = Book.new
    @users = User.page(params[:page])
    @user = current_user
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
