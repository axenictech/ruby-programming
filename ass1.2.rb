def data

	print "Enter Name:   "
	name=gets
	print "Enter Rating: "
	rating=gets
	rate=rating.to_i

	if (name=~ /^[-a-z]+$/)
		puts "Name: #{name}"
		else
			puts "Enter alphabate only"
	end
	
		if rate>0 and rate<=30
			puts "Rating: Poor"
			elsif rate>30 and rate<=50
			puts "Rating: Ok"
			elsif rate>50 and rate<=60
			puts "Rating: Good"
			elsif rate>60 and rate<=80
			puts "Rating: Very Good"
			elsif rate>80 and rate<=100
			puts "Rating: Excelent"
		    elsif
		    	puts "Enter valid rating"
		end
end

data