class School < ActiveRecord::Base
	validates :school_name, presence:true, length: {minimum: 1, maximum: 10}

	validates :school_address, presence:true, length: {minimum: 1, maximum: 30}
end
