class RemoveColumnFromGroups < ActiveRecord::Migration
  def change
    remove_column :groups, :user_id, :integer
  end
end
