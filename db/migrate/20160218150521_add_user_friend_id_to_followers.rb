class AddUserFriendIdToFollowers < ActiveRecord::Migration
  def change
    add_column :followers, :user_friend_id, :integer
  end
end
