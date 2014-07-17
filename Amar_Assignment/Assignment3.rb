


	# program for dispaying rating by accepting name & rating within single method and withought class
	def accept
		
		puts("Enter Name:")
		@name=gets
		puts(" Enter Rating:")
		@rat=gets.to_i

	
	
		if @rat<= 30 
			puts("Name: #{@name} Rating: poor....")
		elsif @rat<=50 && @rat>30
			puts("Name: #{@name} Rating: ok....")	
		elsif @rat<=60 && @rat>50
			puts("Name: #{@name} Rating: good....")	
		elsif @rat<=80 && @rat>60
			puts("Name: #{@name} Rating: Very Good....")
		else
			puts("Name: #{@name} Rating: Excellent....")	
		end
	    end
	

		accept  # Directly call the accept method no need to create object bcz we are not using class..

	
	
