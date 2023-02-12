class Public::PostsController < ApplicationController
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end
  
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
private
  def post_params
    params.require(:post).permit(:fish_id, :user_id, :title, :content, :recipe, :method, :image)
  end
  
end
