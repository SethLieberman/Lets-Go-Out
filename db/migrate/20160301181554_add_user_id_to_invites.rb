class AddUserIdToInvites < ActiveRecord::Migration
  def change
    add_column :invites, :user_id, :integer
  end
end
