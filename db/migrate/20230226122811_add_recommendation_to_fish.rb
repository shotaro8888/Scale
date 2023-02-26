class AddRecommendationToFish < ActiveRecord::Migration[6.1]
  def change
    add_column :fish, :recommendation, :string
  end
end
