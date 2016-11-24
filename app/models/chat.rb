class Chat < ActiveRecord::Base
  belongs_to :group
  has_many :public_message
  has_many :message
end
