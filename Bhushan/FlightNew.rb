#this will access mysql database via connection 
require "mysql"

class Project
	begin
		con=Mysql.connect('localhost','root','root','MyDB')	
	puts "\n!!!!!!!!!!!!!!!!!!!----------Flight Booking System---------!!!!!!!!!!!!!!!!!!!!!\n\n"
	puts "1. Booking\t 2. Cancel Booking\t 3. Exit\n\n"
	print "Please enter your choice :"
	choice=gets.to_i
	source=""
	destination=""

	case (choice)
	
		when 1
			begin
				print "Enter your name :"
				name=gets.chomp
				name_siz=name.size
			end while (name!=~ /^[A-Z a-z]+$/) && (name_siz<3) || (name_siz>15)

			#begin
				print "Enter your Age :"
				age=gets.chomp
			#end while (age=~ /^[-]?[1-9]([0-9]*)?$/) 
		print "Enter your Contact number : +91 "
		phno=gets.chomp

		stmt=con.query("select id from passanger_details")
	
		while row=stmt.fetch_row do 
			rs=row[0]
		#end of do
		end
		rs=rs.next			
				
	

		stmt1=con.prepare("insert into passanger_details values(?,?,?,?)")
		stmt1.execute(rs,name,age,phno)
		

		puts "\n"
		puts "**********************Source and Destination Availables**************************\n\n"
		puts "\t1) Pune\t 2)Mumbai\t 3)Delhi\t 4)Chennai \n\n\n"
		print "\n\nEnter your source :"
		source=gets.chomp
		print "\nEnter your destination :"
		destination=gets.chomp
		stm2=con.prepare("select fair from flight_details where source=? and destination=?")
		stm2.execute(source,destination)
		 row=stm2.fetch
		 	pay=row[0]
		    puts "\n\n\n\n\nHello, #{name} thank you for booking ticket. Your fair is Rs #{pay}"
		   
		stmt4=con.query("select ticket_id from ticket_details")
		#stmt4.execute
		while row=stmt4.fetch_row do
			tic_no=row[0]

			end
			ticket=tic_no.next

			puts "Your ticket Number is :#{ticket}"

		stmt5=con.prepare("insert into ticket_details values(?,?,?)")
		stmt5.execute(rs,ticket,pay)	
		when 2
			puts "Not working"

		when 3
			 exit -1	
		else
			puts "\n\n\nPlease enter correct choice\n\n"

	 #end of case	
	end


	# rescue MySql::Error => e
	# 	puts #{e}
	# ensure
	# 	puts "In ensure"
	# 	con.close if con

	#End of begin	
	end


#end of class
end