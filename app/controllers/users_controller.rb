class UsersController < ApplicationController
  def edit
        @uses = User.find(params[:id])

  end

   def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)  
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])  
  end

    private
  def list_params
    params.require(:user).permit(:name, :image, :introduction)
  end
end
