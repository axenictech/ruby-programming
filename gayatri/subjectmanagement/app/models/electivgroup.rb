class Electivgroup < ActiveRecord::Base
	belongs_to :batch
	has_many :subjects
end
