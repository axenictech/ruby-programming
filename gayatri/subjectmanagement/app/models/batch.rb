class Batch < ActiveRecord::Base
	has_many :subjects
	has_many :electivgroups
end
