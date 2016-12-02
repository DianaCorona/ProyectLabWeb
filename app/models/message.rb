class Message < ActiveRecord::Base
  belongs_to :chat_member
  belongs_to :chat
  	def user2Id
  	 user2_id
	end
end
