class ChatMember < ActiveRecord::Base
  belongs_to :group
  belongs_to :chat
  belongs_to :user2
end
