class Group < ActiveRecord::Base
	has_many :events
	has_many :collections
	has_many :notes
	has_many :user2
	has_one :chat
end
