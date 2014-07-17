
#prog using simple method
def third(name,state)
    
    n=state.to_i
    
    
    if n>=0 and n<=30
    	 puts "pool"
    elsif n>=30 and n<=60
     	puts "good"

    elsif n>=60 and n<=100
    	 puts "very good"

    	else puts "no is out of range" #validation for negative no
    end
			 

		


end
third(gets,gets)