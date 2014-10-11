class Disk < ActiveRecord::Base
	has_one :account
	validates :firstName, length: { minimum: 5,maximum: 10 }
	validates :lastName, length: { minimum: 5,maximum: 10 }
end
