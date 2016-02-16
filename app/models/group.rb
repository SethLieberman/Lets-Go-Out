class Group < ActiveRecord::Base
	has_many :users
	has_many :posts
	has_many :admins

	belongs_to :user
end
