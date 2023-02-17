class Public::HomesController < ApplicationController
  
  def top
    @fishes = Fish.all
    @posts = Post.all
  end
  
end
