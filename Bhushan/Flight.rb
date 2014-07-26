#require is used to do interface between ruby and database
require "mysql"
class Flight
	#this is a block of code business logic
	begin
		puts "*****************Welcome*****************"
		puts "1) Booking"
		puts "2) Cancel Booking"
		# puts "3) Show Ticket"
		puts "3) Exit"
		puts
		print "Enter Choice: "
		#entered choice is converted to integer i=using to_i method 
		choice=gets.to_i
		#initialized variable
		fair=0
		destination =""
		#CASE statements is used to check the multiple conditions 
		case (choice)

		#when user enters 1 loop will enter 
		when 1
		
			print "Enter your Name: "
			#.chomp will remove default \n
			name=gets.chomp
			print "Enter your Age: "
			age=gets
			print "Enter your Phone Number: +91 "
			phno=gets
			puts "From PUNE"
			puts "Enter your Destination :"
			puts"1) Mumbai "
			puts "2) Banglore"
			puts "3) Delhi"
			puts "4) Chennai"
			print "Enter your choice :"
			des_choice=gets.to_i
			
			if (des_choice==1)
				fair+=2000
				destination="mumbai"
			elsif (des_choice==2)
				fair+=7000
				destination="banglore"
			elsif (des_choice==3)
				fair+=11000
				destination="delhi"
			elsif (des_choice==4)
				fair+=9000
				destination="chennai"
			else
				puts "<<<<<<<<<<<<<<<<<<<<<Please select correct Destination>>>>>>>>>>>>>>>>>>"
			#iF ends	
			end
		#when entered 2 
		when 2
			puts "Enter your tickit No :"
			temp=gets.to_s
			#this block is under working 
		when 3
			con.close if con
		else 
			puts
			puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Wrong choice>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
			puts
		#end of CASE
		end
				
			
			#Mysql called in ruby program connect to DataBase through localhost u	
			con=Mysql.connect('localhost','root','root','MyDB')
			puts "Connection Established. . . . !"
				result=con.prepare("insert into flight values(?,?,?,?)")
				result.execute(name,age,phno,destination)
				
  			    puts
  			    puts "Greetings to #{name} your ticket has been booked and your fair is Rs. #{fair}"
  			    puts

				
			


rescue Mysql::Error => e
		puts #{e}
	
ensure
	#Connection of database is closed
	con.close if con

end

end