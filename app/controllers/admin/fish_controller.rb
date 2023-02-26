class Admin::FishController < ApplicationController
  
  def index
    @fishes = Fish.all
  end

  def new
    @fish = Fish.new
  end

  def create
    @fish = Fish.new(fish_params)
    @fish.save
    redirect_to admin_fish_index_path
  end

  def show
    @fish = Fish.find(params[:id])
  end

  def edit
    @fish = Fish.find(params[:id])
  end
  
  def update
    @fish = Fish.find(params[:id])
    @fish.update(fish_params)
    redirect_to admin_fish_index_path
  end
  
  def destroy
    @fish = Fish.find(params[:id])
    @fish.destroy
    redirect_to admin_fish_index_path
  end
  
private
  def fish_params
    params.require(:fish).permit(:genre_id, :fish_name, :introduction, :season, :recommendation, :image)
  end
end
