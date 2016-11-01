class Group < ActiveRecord::Base
	has_many :event
	has_many :collection
	has_many :note
end
