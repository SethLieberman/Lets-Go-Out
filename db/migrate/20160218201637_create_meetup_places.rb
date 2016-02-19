class CreateMeetupPlaces < ActiveRecord::Migration
  def change
    create_table :meetup_places do |t|
      t.integer :group_id
      t.integer :place_id

      t.timestamps null: false
    end
  end
end
