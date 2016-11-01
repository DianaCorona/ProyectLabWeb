class PrivateConversation < ActiveRecord::Base
  belongs_to :contact
  belongs_to :user
  has_many :Private_Message
end
