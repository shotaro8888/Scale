class Public::FishController < ApplicationController
  
  def index
    @fishes = Fish.all
  end
  
  def show
    @fish = Fish.find(params[:id])
    @posts = Post.all
  end
  
end
