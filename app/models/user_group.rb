class UserGroup < ActiveRecord::Base
	belongs_to :user
	belongs_to :shared_group, class_name: "Group", foreign_key: :group_id

	has_many :invites
end
