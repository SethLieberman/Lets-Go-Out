class MeetupPlace < ActiveRecord::Base
	belongs_to :group
	belongs_to :place
end
