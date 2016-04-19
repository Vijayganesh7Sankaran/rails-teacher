class User < ActiveRecord::Base
	has_secure_password
	has_many :badges
	has_one :profile
	has_one :character
end
