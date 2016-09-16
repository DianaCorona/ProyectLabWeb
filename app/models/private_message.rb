class PrivateMessage < ActiveRecord::Base
  belongs_to :privateConversation
end
