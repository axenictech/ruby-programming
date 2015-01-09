module Opr
	IDEA=3
	AIRTAL=2
	AIRCEL=1

	def ideaUser(val)
		 val * IDEA		
	end
	def airtelUser(val)
		 val * AIRTAL	
	end
	def aircelUser(val)
		 val * AIRCEL	
	end

end

class Customer
	include Opr

	@duration
	 	
	 		def initialize(duration)
  				@duration = duration
  			end

	def bill(st)
		case st
		when "Idea" then
			self.ideaUser(@duration)

			when "Airtel" then
			self.airtelUser(@duration)

				when "Aircel" then
				self.aircelUser(@duration)
		end
			
	end

end

c1=Customer.new(2)
puts "Idea user bill for 2 min :#{c1.bill("Idea")}"

c2=Customer.new(3)
puts "Airtel user bill for 3 min :#{c2.bill("Airtel")}" 

c3=Customer.new(4)
puts "Aircel user bill for 4 min :#{c3.bill("Aircel")}" 


