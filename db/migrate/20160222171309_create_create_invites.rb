class CreateCreateInvites < ActiveRecord::Migration
  def change
    create_table :create_invites do |t|
      t.string :email
      t.integer :group_id
      t.integer :sender_id
      t.integer :recipient_id
      t.string :token

      t.timestamps null: false
    end
  end
end
