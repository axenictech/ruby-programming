class People < ActiveRecord::Base
	has_many :bankdetails
	validates :firstname, presence:true,
						  length:{minimum:5,maximum:20},
					      format:{with:/\A[a-zA-Z_"."-]+\Z/}
     validates :lastname,  presence:true,
 						  length:{minimum:5,maximum:20},
 					      format:{with:/\A[a-zA-Z_"."-]+\Z/}
 	validates :age, presence:true,
						numericality:{only_integer:true}
 	validates :address,presence:true
 	validates :bloodGroup,presence:true,
 	           format:{with:/(A|B|AB|0)(\+|-)/}	
 	# validates :phoneNo,
 	#           presence:true,
 	#           length:{minimum:10,maximum:10},
	 #            numericality:{only_integer:true}, 
	 #             format:{with:/d[0-9]/}
 	validates :email,presence:true,
 	          format:{with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
 }
 	validates :nationality,presence:true,format:{with:/\A[a-zA-Z_"."-]+\Z/}
 	validates :country,presence:true,format:{with:/\A[a-zA-Z_"."-]+\Z/}
end
