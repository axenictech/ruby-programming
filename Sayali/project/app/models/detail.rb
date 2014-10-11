class Detail < ActiveRecord::Base
	has_many :banks

	validates :firstname, presence: true, format: { with: /\A[a-zA-Z]+\z/}
	validates :lastname, presence: true, format: { with: /\A[a-zA-Z]+\z/}
	validates :address, presence: true
	validates :age, presence: true,numericality: true,length: { minimum: 2 ,maximum:2}
	validates :email, presence: true,uniqueness: true,length: { minimum: 6 ,maximum:20}
	validates :phoneNo, presence: true,numericality: true,uniqueness: true
	validates :bloodGroup, presence: true,length: { minimum: 2 ,maximum:2}
	validates :country, presence: true, format: { with: /\A[a-zA-Z]+\z/}
	validates :nationality, presence: true, format: { with: /\A[a-zA-Z]+\z/}
end
