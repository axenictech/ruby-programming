class Batch < ActiveRecord::Base
	has_many :normal,dependent: :destroy
	has_many :elective,dependent: :destroy
	validates :b_name, presence: true, format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }
	validates :year, presence: true,numericality: true,length: { minimum: 4 ,maximum:4}
end
