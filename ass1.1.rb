class Task

		print "Enter Name:   "
		name=gets

	if (name=~ /^[-a-z]+$/)

		if name.length.to_i<20
				
				print "Enter rating:   "
				rating=gets
				rate=rating.to_i
		
			if rate>0 and rate<=30
					puts "Name: #{name}"
					puts "Rating: Poor"
				elsif rate>30 and rate<=50
					puts "Name: #{name}"
					puts "Rating: Ok"
				elsif rate>50 and rate<=60
					puts "Name: #{name}"
					puts "Rating: Good"
				elsif rate>60 and rate<=80
					puts "Name: #{name}"
					puts "Rating: Very Good"
				elsif rate>80 and rate<=100
					puts "Name: #{name}"
					puts "Rating: Excelent"
		   		elsif 
		    		puts "Enter valid rating"
		    end
		else 
			puts "Enter 20 charcter only"
		end
	else
		puts "Enter alphabate only"
	end


end
