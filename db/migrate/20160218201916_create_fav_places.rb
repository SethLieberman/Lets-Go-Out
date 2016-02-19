class CreateFavPlaces < ActiveRecord::Migration
  def change
    create_table :fav_places do |t|
      t.integer :place_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
