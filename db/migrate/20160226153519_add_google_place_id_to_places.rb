class AddGooglePlaceIdToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :google_place_id, :string
  end
end
