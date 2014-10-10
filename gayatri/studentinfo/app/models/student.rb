class Student < ActiveRecord::Base
	validates :name ,presence:true,length: {minimum: 1, maximum: 20},format: {with: /\A[a-z A-Z]+\Z/,message:"only letter allows"}
	validates :address,presence:true,length: {minimum: 1, maximum: 20},format: {with: /\A[a-z A-Z]+\Z/,message:"only letter allows"}
	validates :marks,presence:true,numericality: {only_integer:true, greater_than:0,less_than:100}
end
