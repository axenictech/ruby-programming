class Ratings

		# initialize method to initialize the variables name and rating	
		def initialize(name,rating)
		@name , @rating = name, rating
		
		if(name=~ /^[A-Z]+[a-z]{3,10}+$/)	
		puts "The Name is #{name}"	
		a=rating.is_a? Integer
		 #a Is a variable to just store the boolen. if a is an Interger it will Return true else False
		if a==true 
			case rating.to_i
				when 1..30
	  				puts "The Rating for the #{name} is Poor"
				when 31..50
	  				puts "The Rating for the #{name} is OK"
				when 51..60
	  				puts "The Rating for the #{name} is Good"
				when 61..80
	  				puts "The Rating for the #{name} is Very Good"
				when 81..100
	  				puts "The Rating for the #{name} is Excelent"

				else
	  				puts "Please type ratings between 1 To 100 "
				end
			# If not a number
			else 					
				puts "Please enter A Number"	
			end
		else
		puts "Please enter a string with length between 3 t0 10 only and starting with capital letter"
		end
	end
end
Ratings.new(gets,gets)


