# To do programm in under construction

require "mysql"

class Ticket

	def initialize
	
		begin

	# mysql connectivity
			@connection=Mysql.connect("localhost","root","mysql","Testdb")
			
			puts "\n\n\t\t\t\tFlight Book\n\n"
			puts "\t\t\t\t1.Book Your Ticket\n\t\t\t\t2.Exit\n\n"
	#call menu method
			menu
	# handle ecxception
		rescue Mysql::Error=>e

			puts "Error in Connection-.....#{e}"

		ensure
	# close connection
			@connection.close if @connection

		end

	end
# menu method for menu
	def menu

		print "\t\t\t\tEnter Your Choice: "
# menu choice 
		choice=gets.to_i

		case choice

			when choice=1
				puts "\n\n\t\t\t\tRegister here...Fill all data\n"
		# call method register_name
				register_name
			when choice=2
				@connection.close if @connection
		# exit -1 useing for exit program
				exit -1
			else
            	puts "\n\t\t\t\tInvalid Choice!!!...Enter Correct\n\n"
        # call menu method
            	menu
        end
	end

	def register_name

		print "\n\n\t\t\t\tEnter Your First Name: "
	# passanger name
		name=gets.chomp
		name_size=name.length
	#check validation
		if (name=~ /^[A-Z a-z]+$/) and (name_size>2 and name_size<21)
	# assign to istance variable name
			@name=name
	# call register_dob method
			register_dob
		else
			puts "\n\n\t\t\t\tInvalid Name!!!...Enter Correct"
			register_name
		end
	end

	def register_dob

		print "\n\n\t\t\t\tEnter Your DOB(yyyy/mm/dd): "
		dob=gets.chomp
		size=dob.length

		if dob=~ /\d{4}+\/+\d{2}+\/+\d{2}/ and size<11
			@dob=dob
			register_mobile
		else
			puts "\n\n\t\t\t\tInvalid Date!!!...Enter Correct"
			register_dob
		end
	end

	def register_mobile

		print "\n\n\t\t\t\tEnter Your Mobile No.: "
		mobile=gets
		size=mobile.length

		if mobile=~ /\d{10}/ and size<12

			@mobile=mobile.to_i
			register_email
		else
			puts "\n\n\t\t\t\tInvalid Mobile No!!!...Enter Correct"
			register_mobile
		end
	end
	
	def register_email

		print "\n\n\t\t\t\tEnter Your Email-Id: "
		email=gets

		if email=~ /^[a-z0-9._]+@[a-z]+\.[a-z]/
			@email=email
			register
		else
			puts "\n\n\t\t\t\tInvalid Email-Id!!!...Enter Correct"
			register_email
		end
	end

	def register
		begin

			statmt=@connection.prepare("select id from passenger")
			statmt.execute

			while rs=statmt.fetch do
				
				id=rs[0]				
			end

			@id=id.next

			stmt=@connection.prepare("insert into passenger values(?,?,?,?,?)")
			stmt.execute(@id,@name,@dob,@mobile,@email)
			@connection.commit

			puts "\n\n\t\t\t\t\tRegister Successfully...!!!"
			book
		rescue Mysql::Error=>e

			puts "Error in Connection-.....#{e}"

		ensure

			@connection.close if @connection

		end

	end

	def book

		print "\n\n\t\t\t\t\tEnter your source city: "
		from_city=gets.chomp
		size=from_city.length
		if (from_city=~ /^[A-Z a-z]+$/) and (size>2 and size<21)
			print "\n\t\t\t\t\tEnter you destination city: "
			to_city=gets.chomp
			size1=to_city.length
				if (to_city=~ /^[A-Z a-z]+$/) and (size1>2 and size1<21)
					
					@from_city=from_city
					@to_city=to_city
					flite					
				else
					puts "\n\n\t\t\t\tInvalid city!!!...Enter Correct"
					book
				end
		else
			puts "\n\n\t\t\t\tInvalid city!!!...Enter Correct"
			book
		end
	end

	def flite

			begin

			stmt2=@connection.prepare("select flite_id, payment from flite where from_city=? and to_city=?")
			stmt2.execute(@from_city,@to_city)
			
			recordset=stmt2.fetch

				if recordset.nil? 
					puts "\n\n\t\t\t\tNo Flights Available!!!...Try again"
					book_again
				else
					@flite_id=recordset[0]
					@payment=recordset[1]
					puts "\n\n\t\t\t\tYou want to going from #{@from_city} to #{@to_city}"
					puts "\n\t\t\t\tYou want to pay Rs. #{@payment}"
					confirm
				end	
			rescue Mysql::Error=>e

			puts "Error in Connection-.....#{e}"

			ensure

			@connection.close if @connection

			end
	end

	def book_again

			print "\n\t\t\t\tDo you want continue to book ticket(y/n)?: " 
					ch=gets.chomp
					
					if ch=="y"
						book
					elsif ch=="n"
						puts "\n\t\t\t\tThank You!!!"
						Ticket.new
					else
						puts "\n\n\t\t\t\tInvalid Choice!!!...Try again"
						book_again
					end	
	end

	def confirm

		print "\n\t\t\t\tAre you sure to confirme book ticket(y/n)?: " 
		ch=gets.chomp
		
		if ch=="y"
			puts "\n\t\t\t\tPlease pay your payment Rs. #{@payment}"
			ticket
		elsif ch=="n"
			puts "\n\t\t\t\tThank You!!!"
			Ticket.new
		else
			puts "\n\n\t\t\t\tInvalid Choice!!!...Try again"
			confirme
		end	

	end

	def ticket

		begin

			stmt3=@connection.prepare("select ticket_no from ticket")
			stmt3.execute

			while rs1=stmt3.fetch do
				
				tk=rs1[0]				
			end

			@ticket_no=tk.next

			stmt4=@connection.prepare("insert into ticket values(?,?,?)")
			stmt4.execute(@id,@ticket_no,@flite_id)
			@connection.commit

			puts "\n\t\t\t\tYour ticket is confirme...."
			print_ticket
			rescue Mysql::Error=>e

			puts "Error in Connection-.....#{e}"

			ensure

			@connection.close if @connection

			end
	end

	def print_ticket

		begin

			stmt6=@connection.prepare("select pass_id, flit_id from ticket where ticket_no=?")
			stmt6.execute(@ticket_no)

			recs=stmt6.fetch
				
			@pass_id=recs[0]			
			@flit_id=recs[1]

			stmt7=@connection.prepare("select name from passenger where id=?")
			stmt7.execute(@pass_id)
			
			res=stmt7.fetch	
			@name=res[0]

			stmt8=@connection.prepare("select from_city, to_city, payment from flite where flite_id=?")
			stmt8.execute(@flit_id)
			
			while record=stmt8.fetch do
			@from_city=record[0]
			@to_city=record[1]
			@payment=record[2]
			end

			puts "\n\n\n\t\t\t\tYour Ticket"
			puts "\n\t\t\t\tTicket No: #{@ticket_no}"
			puts "\n\t\t\t\tPassanger Name: #{@name}"
			puts "\n\t\t\t\tTravel From #{@from_city} To #{@to_city}"
			puts "\n\t\t\t\tYou had paied Rs. #{@payment}"
			puts "\n\nCongratulation!!!...Enjoy Your Jurney.!!"
				Ticket.new
			rescue Mysql::Error=>e

			puts "Error in Connection-.....#{e}"

			ensure

			@connection.close if @connection

			end

	end

end

Ticket.new