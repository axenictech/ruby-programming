
#prog using class n if else

class Msg
	def initialize(name,state)
		@name=name
		@state=state

		i=state.to_i

        forstate = state.is_a? Integer
        if(forstate==false)
        	puts "enter the digit only"

        elsif i>=0 and i<=30
			puts "pool"

		elsif i>=30 and i<=60
			puts "good"
		elsif i>=60 and i<=90
			puts "very good"

		
        else 
        	puts "valid"

	end
	end	
    end
		Msg.new(gets,gets)
