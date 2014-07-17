

# program for dispaying rating by accepting name & rating by using switch case and while loop
	class Assignment4
		
            begin

		puts("Enter Name:")
		begin
			puts("Enter Name:")
			@name=gets
	

			if (@name=~ /^[-a-z]+$/)  #checking validation for entering only characters
				
				break
			else
		
				puts"Enter only letters...."
			end
		end while (@name!=~ /^[-a-z]+$/)


		begin
		      	puts("Enter Rating:")
		   	@rat=gets.to_i
		   	if (@rate!=~ /^[-0-9]+$/)	#checking validation for entering only characters

				break
		  	else
				puts"Enter only no......"
		  	end
	    	 end while(@rate=~ /^[-0-9]+$/)

		
		
		

		case(@rat)    #switch to rating and calulate grade and dispay the result

		when  0..30   
	
			puts("Name: #{@name} Rating: poor....")

		when  31..50
			puts("Name: #{@name} Rating: ok....")

		when  51..60
			puts("Name: #{@name} Rating: good....")	

		when  61..80
			puts("Name: #{@name} Rating: Very Good....")

		when  81..100
			puts("Name: #{@name} Rating: Excellent....")
		else
			puts("Plz enter Number Between/ 0-100")

		end

	
		puts("Do you Want to Cntineu.....[Y/N]")
		@opt=gets
	  end while(@opt.casecmp "y")  #break loop is does not want to continue..

end
	Assignment4
