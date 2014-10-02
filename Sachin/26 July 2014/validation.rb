class Validation

	puts "\nEnter the name :"
	name=gets

	#validation of name 
	if(name=~/^[A-Z a-z]+$/)

		puts "v\nalid data"
	
		else
		puts "\nInvalid Data"
	end

	puts "\n\nEnter the Address :"
	addr=gets

	addlengh=addr.length
	#validation of address
	if (addr=~/^[0-9A-Z a-z0-9]+$/ and addlengh<30)

		puts "\nvalid Address"

		else
		puts "\nInvalid Data"
		
	end

	puts "\n\nEnter the Phone Number :"
	phone=gets.chomp
	p_length=phone.length
	#validation of phone number
	if phone=~/\d{10}/ && p_length>9 && p_length<11	  
		puts "\nvalid mobile number"

		else
		puts "\nInvalid mobile number"
	end

	
	puts "\n\nEnter the Email Address :"
	email=gets.chomp
	#validation of email address
	if email=~/[A-Za-z0-9]+@[A-Za-z]+.[A-Za-z]/
		puts "\nvalid email address"

		else
		puts "\nInvalid email address"
	end




	puts "\n\n\n\n.............Your entered data................"

	puts "\n\nYour name is : #{name}"
	puts "\n\nYour address is : #{addr}"
	puts "\n\nYour mobile number is : #{phone}"
	puts "\n\nYour email id is : #{email}"
end