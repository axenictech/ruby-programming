class Subject < ActiveRecord::Base
	belongs_to :batch
	belongs_to :electivegroup
end
