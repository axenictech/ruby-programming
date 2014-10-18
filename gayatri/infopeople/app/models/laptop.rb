class Laptop < ActiveRecord::Base

	has_many :banks, dependent: :destroy
 	validates :fname,presence:true,length:{minimum: 1,maximum: 20},format:{with: /\A[a-z A-Z]+\Z/,message:"Please enter only letter allows"}
 	validates :lname ,presence:true,length: {minimum: 1, maximum: 20},format: {with: /\A[a-z A-Z]+\Z/,message:"Please enter only letter allows"}
	validates :address,presence:true,length: {minimum: 1, maximum: 20},format: {with: /\A[a-z A-Z]+\Z/,message:"Please enter only letter allows"}
	validates :age,presence:true,numericality: {only_integer:true, greater_than:0,less_than:200}
	validates :email,presence:true,format:{with: /\A/,message:"Please check your email again"}
	validates :phone,presence:true,numericality:{only_integer:true},length:{minimum:10,maximum:10}
	validates :nationality,presence:true,length:{minimum: 1,maximum: 20},format:{with: /\A[a-z A-Z]+\Z/,message:"Please enter only letter allows"}
	validates :bloodgroup,presence:true,length:{minimum:2,maximum:3},format:{with:/[A +O +B]+/,message:"Please check your Blood Group"}
	validates :country,presence:true,length:{minimum: 1,maximum: 20},format:{with: /\A[a-z A-Z]+\Z/,message:"Please enter only letter allows"}
end
