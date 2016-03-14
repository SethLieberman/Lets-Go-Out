class Place < ActiveRecord::Base
	
	has_many :groups, through: :meetup_places
	has_many :groups

	has_many :users, through: :fav_places 
	has_many :users
end
