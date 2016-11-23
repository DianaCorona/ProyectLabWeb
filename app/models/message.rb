class Message < ActiveRecord::Base
  belongs_to :chat_member
  belongs_to :chat
end
