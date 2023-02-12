class Public::UsersController < ApplicationController
  
  def data
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(current_user.id)
  end

  def unsubscribe
  end
  
  def withdrawal
  end
    
  def index
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end
  
private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :telephone_number, :is_deleted, :profile_image)
  end
  
end
