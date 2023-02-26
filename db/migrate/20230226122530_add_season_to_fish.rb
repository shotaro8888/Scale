class AddSeasonToFish < ActiveRecord::Migration[6.1]
  def change
    add_column :fish, :season, :string
  end
end
