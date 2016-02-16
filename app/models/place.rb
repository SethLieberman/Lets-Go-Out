class Place < ActiveRecord::Base
	belongs_to :groups
	belongs_to :users
	belongs_to :admin
	has_many :comments
	has_many :posts

end
