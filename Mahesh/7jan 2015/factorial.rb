def factorial()
	puts "\n\n\n::::::::::::::::Program Showing Facorial Of Your No::::::::::::::::::::::::::::::::::::::::::::\n\n"

	print "\n\nEnter your No to find Facorial : "
	no=gets().chomp.to_i
	#puts "#{no}"
	i=1 
	fact=1
	while(no>=i)

		fact=fact*i
		i+=1
		# puts"#{i}"
	end
	puts "\n\nFacorial of #{no} is :#{fact}\n"

	puts "\n\n\n::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n\n"

	
end
factorial