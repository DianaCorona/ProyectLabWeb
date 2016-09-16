class User < ActiveRecord::Base
	has_namy :Contact
	has_namy :Public_Message
end
