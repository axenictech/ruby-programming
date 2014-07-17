def caseTask
	
	print "Enter Name:   "
		name=gets

	value=name.length.to_i

	if (name=~ /^[-a-z]+$/) and (value>3 and value<=11)
				
				print "Enter rating:   "
				rating=gets
				rate=rating.to_i
		
			case rate

			when 1..30
				puts "Name: #{name}"
				puts "Rating: Poor"
		 	when 31..50
		 		puts "Name: #{name}"
				puts "Rating: Ok"
			when 51..60
				puts "Name: #{name}"
				puts "Rating: Good"
			when 61..80
				puts "Name: #{name}"
				puts "Rating: Very Good"
			when 81..100
				puts "Name: #{name}"
				puts "Rating: Excelent"
		   	else 
		    	puts "Enter valid rating"
			end

	else 
		puts "Enter valid name"
		
	end
		    		
end

caseTask
