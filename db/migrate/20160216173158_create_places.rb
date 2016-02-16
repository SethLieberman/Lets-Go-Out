class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :placename
      t.integer :group_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
