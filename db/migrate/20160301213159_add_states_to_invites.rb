class AddStatesToInvites < ActiveRecord::Migration
  def change
    add_column :invites, :states, :integer
  end
end
