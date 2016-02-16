class User < ActiveRecord::Base
	has_many :groups
	has_many :followers
	has_many :posts
	has_many :comments
	belongs_to :groups

	has_many :places, through: :groups

	has_secure_password
	validates_confirmation_of :password  
	validates_presence_of :password, on: :create
	validates_presence_of :username, on: :create
	validates_presence_of :email, on: :create
end
