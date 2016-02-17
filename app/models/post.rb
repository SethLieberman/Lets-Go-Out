class Post < ActiveRecord::Base
	belongs_to :group
	has_many :comments
	belongs_to :user

	validates :content, presence: true, length: { maximum: 200 }
end
