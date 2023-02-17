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
    if params[:search] == nil
      @posts = params[:fish_id].present? ? Fish.find(params[:fish_id]).posts : Post.all
      if params[:fish_id].present? 
        @posts = Fish.find(params[:fish_id]).posts
        # byebug
      else
        @posts = Post.all
      end
    
    
    elsif params[:search] == ''
    @posts = params[:fish_id].present? ? Fish.find(params[:fish_id]).posts : Post.all
    else
    @posts = Post.where("title LIKE ?", '%' + params[:search] + '%')
    end
  end
  
  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @post_comment = PostComment.new
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end
  
  def destroy
  end
  
private
  def post_params
    params.require(:post).permit(:fish_id, :user_id, :title, :content, :recipe, :method, :image, tag_ids: [])
  end
  
end
