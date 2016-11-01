class User < ActiveRecord::Base
	has_many :Contact
	has_many :Public_Message
end
