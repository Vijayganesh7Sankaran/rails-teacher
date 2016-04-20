class User < ActiveRecord::Base
	has_secure_password
	has_many :badges
	has_one :profile
	has_one :character
	
	has_attached_file :photo,
                  :url  => "/assets/products/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

validates_attachment_presence :photo
validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
end
