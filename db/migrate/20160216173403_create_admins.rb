class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :username
      t.string :password_digest
      t.string :fname
      t.string :lname
      t.integer :zipcode
      t.string :email

      t.timestamps null: false
    end
  end
end
