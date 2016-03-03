require 'bcrypt'
require 'sendgrid-ruby'

class User < ActiveRecord::Base

	has_attached_file :avatar, styles: { medium: "200x200>", thumb: "100x100>" }, default_url: "/images/:style/missing1.png"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

	has_many :owned_groups, class_name: "Group", foreign_key: "owner_id"

	has_many :shared_groups, through: :user_groups
	has_many :user_groups

	has_many :user_friends, through: :followers

	has_many :places, through: :fav_places
	has_many :places

	has_many :followers
	has_many :posts
	has_many :comments

	# # this is to invite users to groups
	has_many :invitations, :class_name => "Invite", :foreign_key => 'recipient_id'
	has_many :sent_invites, :class_name => "Invite", :foreign_key => 'sender_id'

	# sengrid mailer
	client = SendGrid::Client.new do |c|  
	c.api_key = ENV['SENDGRID_API_KEY']
	end	

	has_secure_password
	validates_confirmation_of :password  
	validates_presence_of :password, on: :create
	validates_presence_of :username, on: :create
	validates_uniqueness_of :username, on: :create
	validates_presence_of :email, on: :create
	validates_uniqueness_of :email, on: :create
end
