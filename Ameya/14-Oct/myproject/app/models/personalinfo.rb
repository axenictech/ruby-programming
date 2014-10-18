class Personalinfo < ActiveRecord::Base
	has_many :bankinfos
	validates :first_name, presence: true, length: {minimum: 1, maximum: 10} #compulsory

	validates :last_name, presence: true, length: {minimum: 1, maximum: 10} #compulsory

	validates :address, presence: false, length: {minimum: 1, maximum: 10} #not compulsory 

	validates :age, presence: false, length: {minimum: 1, maximum: 10} #not compulsory 

	validates :ph_no, presence: false, length: {minimum: 1, maximum: 10} #not compulsory 

	validates :email, presence: false, length: {minimum: 1, maximum: 50} #not compulsory 

	validates :blood_group, presence: false, length: {minimum: 1, maximum: 10} #not compulsory 

	validates :country, presence: false, length: {minimum: 1, maximum: 10} #not compulsory 

	validates :ph_no, numericality: {only_integer: true}

	validates :age, numericality: {only_integer: true}

	validates :first_name, format: {with: /\A[a-zA-Z_"."-]+\Z/}

	validates :last_name, format: {with: /\A[a-zA-Z_"."-]+\Z/}

	validates :blood_group, format: {with: /\A[a-zA-Z_"."-]+\Z/}

	validates :country, format: {with: /\A[a-zA-Z_"."-]+\Z/}

	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
end