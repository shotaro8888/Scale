class Public::FishController < ApplicationController
  
  def index
    @fishes = Fish.page(params[:page]).per(10)
  end
  
  def show
    @fish = Fish.find(params[:id])
    @posts = @fish.posts
  end
  
end
