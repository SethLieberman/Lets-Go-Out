class Group < ActiveRecord::Base
	
	has_many :places, through: :meetup_places
	has_many :places
	
	has_many :users, through: :user_groups
	has_many :user_groups

    has_many :posts
	
end
