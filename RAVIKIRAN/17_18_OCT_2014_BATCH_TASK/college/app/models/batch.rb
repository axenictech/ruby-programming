class Batch < ActiveRecord::Base
	has_many :normal,dependent: :destroy
	has_many :elective,dependent: :destroy
end
