require 'bcrypt'

class User < ActiveRecord::Base
	has_many :groups

	has_many :shared_groups, through: :user_groups
	has_many :user_groups

	has_many :user_friends, through: :followers

	has_many :places, through: :fav_places
	has_many :places

	has_many :followers
	has_many :posts
	has_many :comments

	# this is to invite users to groups
	has_many :invitations, :class_name => "Invite", :foreign_key => 'recipient_id'
	has_many :sent_invites, :class_name => "Invite", :foreign_key => 'sender_id'

	

	has_secure_password
	validates_confirmation_of :password  
	validates_presence_of :password, on: :create
	validates_presence_of :username, on: :create
	validates_uniqueness_of :username, on: :create
	validates_presence_of :email, on: :create
	validates_uniqueness_of :email, on: :create
end
