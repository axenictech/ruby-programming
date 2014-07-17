def caseTask
	
	print "Enter Name:   "
	name=gets
	if (name=~ /^[-a-z]+$/)
		puts "Name: #{name}"
		else
			puts "Enter valid Name"
	end
	print "Enter Rating: "
	rating=gets
	rate=rating.to_i
	validate=name.class
	
	
	
	if (rate=~ /[0-9]+/)
		puts "correct"
		else
			puts "wrong"
	end
	case rate

		when 1..30
			puts "Rating: Poor"
	 	when 31..50
			puts "Rating: Ok"
		when 51..60
			puts "Rating: Good"
		when 61..80
			puts "Rating: Very Good"
		when 81..100
			puts "Rating: Excelent"
	    else 
	    	puts "Enter valid rating"
	end
end
caseTask