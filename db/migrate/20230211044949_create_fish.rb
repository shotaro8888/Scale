class CreateFish < ActiveRecord::Migration[6.1]
  def change
    create_table :fish do |t|
      t.integer "genre_id"
      t.string "fish_name"
      t.string "introduction"
      
      t.timestamps
    end
  end
end
