class Personalinfo < ActiveRecord::Base
	validates :first_nanme, presence: true, format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }
	validates :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }
	validates :address, presence: true
	validates :age, presence: true,numericality: true,length: { minimum: 2 ,maximum:2}
	validates :email, presence: true,uniqueness: true,length: { minimum: 6 ,maximum:20}
	validates :mobile, presence: true,numericality: true,uniqueness: true
	validates :bloodgroup, presence: true,length: { minimum: 2 ,maximum:2}
	validates :country, presence: true, format: { with: /\A[a-zA-Z]+\z/}
end
