class AddLocationToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :location, :string
  end
end
