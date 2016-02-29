class Group < ActiveRecord::Base

	has_many :places, through: :meetup_places
	has_many :places
	
	has_many :users, through: :user_groups
	has_many :user_groups

	belongs_to :owner, class_name: "User"

    has_many :posts
    
	# this is for inviting users to groups
	has_many :invites
end
