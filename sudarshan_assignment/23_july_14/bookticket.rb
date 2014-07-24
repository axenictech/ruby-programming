#using mysql database created booking ticket program

#use mysql model for connectivity
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
	# call method register_name
			register_name
		end
	end

	def register_dob

		print "\n\n\t\t\t\tEnter Your DOB(yyyy/mm/dd): "
	#passanger date of birth
		dob=gets.chomp
		size=dob.length
	#check date of birth is valid
		if dob=~ /\d{4}+\/+\d{2}+\/+\d{2}/ and size<11
	#assign to instance variable dob
			@dob=dob
	#call method register_mobile
			register_mobile
		else
			puts "\n\n\t\t\t\tInvalid Date!!!...Enter Correct"
	#call method register_dob
			register_dob
		end
	end

	def register_mobile

		print "\n\n\t\t\t\tEnter Your Mobile No.: "
	#oassanger mobile number
		mobile=gets
		size=mobile.length
	#check mobile is number and have 10 digit
		if mobile=~ /\d{10}/ and size<12
	#assign value to instance variable mobile
			@mobile=mobile.to_i
	#call method register email
			register_email
		else
			puts "\n\n\t\t\t\tInvalid Mobile No!!!...Enter Correct"
	#call method register mobile
			register_mobile
		end
	end
	
	def register_email

		print "\n\n\t\t\t\tEnter Your Email-Id: "
	#passanger email
		email=gets
	#check email is valid
		if email=~ /^[a-z0-9._]+@[a-z]+\.[a-z]/
	#assign value to instace variable email
			@email=email
	#call method register
			register
		else
			puts "\n\n\t\t\t\tInvalid Email-Id!!!...Enter Correct"
	#call method register email
			register_email
		end
	end

	def register
		begin
	#use statement to excute query
			statmt=@connection.prepare("select id from passenger")
			statmt.execute
	#fetch record in recordset
			while rs=statmt.fetch do
				
				id=rs[0]				
			end
	# id increment by 1
			@id=id.next

			stmt=@connection.prepare("insert into passenger values(?,?,?,?,?)")
			stmt.execute(@id,@name,@dob,@mobile,@email)
			@connection.commit

			puts "\n\n\t\t\t\t\tRegister Successfully...!!!"
	#call method book
			book
		rescue Mysql::Error=>e

			puts "Error in Connection-.....#{e}"

		ensure

			@connection.close if @connection

		end

	end

	def book

		print "\n\n\t\t\t\t\tEnter your source city: "
	#flite source city
		from_city=gets.chomp
		size=from_city.length
	#check validation for source city
		if (from_city=~ /^[A-Z a-z]+$/) and (size>2 and size<21)
		
			print "\n\t\t\t\t\tEnter you destination city: "
		#flite destination city
			to_city=gets.chomp
		
			size1=to_city.length
		#check validation for destination city		
				if (to_city=~ /^[A-Z a-z]+$/) and (size1>2 and size1<21)
			#assign value to instance variable
					@from_city=from_city
					@to_city=to_city
			#call method flite
					flite					
				else
					puts "\n\n\t\t\t\tInvalid city!!!...Enter Correct"
			#call method book
					book
				end
		else
			puts "\n\n\t\t\t\tInvalid city!!!...Enter Correct"
		#call method book
			book
		end
	end

	def flite

			begin
		#excute query
			stmt2=@connection.prepare("select flite_id, payment from flite where from_city=? and to_city=?")
			stmt2.execute(@from_city,@to_city)
		#fetch recorde
			recordset=stmt2.fetch

				if recordset.nil? 
					puts "\n\n\t\t\t\tNo Flights Available!!!...Try again"
					book_again
				else
			#assign value to insatce variable from databaase
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
				
				#get choice from user
					ch=gets.chomp
				#check choice
					if ch=="y"
						book
					elsif ch=="n"
						puts "\n\t\t\t\tThank You!!!"
					#call new ticket class
						Ticket.new
					else
						puts "\n\n\t\t\t\tInvalid Choice!!!...Try again"
					#call method bool again
						book_again
					end	
	end

	def confirm

		print "\n\t\t\t\tAre you sure to confirme book ticket(y/n)?: " 
	#get choice from user
		ch=gets.chomp
	#check choice
		if ch=="y"
			puts "\n\t\t\t\tPlease pay your payment Rs. #{@payment}"
			ticket
		elsif ch=="n"
			puts "\n\t\t\t\tThank You!!!"
		#call new ticket class
			Ticket.new
		else
			puts "\n\n\t\t\t\tInvalid Choice!!!...Try again"
		#call method confirm
			confirme
		end	

	end

	def ticket

		begin
	#excute query
			stmt3=@connection.prepare("select ticket_no from ticket")
			stmt3.execute
	#fetch recorde
			while rs1=stmt3.fetch do
				
				tk=rs1[0]				
			end
	#increment value ticket no by 1
			@ticket_no=tk.next
	#excute query
			stmt4=@connection.prepare("insert into ticket values(?,?,?)")
			stmt4.execute(@id,@ticket_no,@flite_id)
			@connection.commit

			puts "\n\t\t\t\tYour ticket is confirme...."
	#call method print ticket
			print_ticket
			rescue Mysql::Error=>e

			puts "Error in Connection-.....#{e}"

			ensure

			@connection.close if @connection

			end
	end

	def print_ticket

		begin
	#excute query
			stmt6=@connection.prepare("select pass_id, flit_id from ticket where ticket_no=?")
			stmt6.execute(@ticket_no)
	#fetch recorde
			recs=stmt6.fetch
	#assign value from database
			@pass_id=recs[0]			
			@flit_id=recs[1]
	#excute query
			stmt7=@connection.prepare("select name from passenger where id=?")
			stmt7.execute(@pass_id)
	#fetch recorde
			res=stmt7.fetch	
	#assign value from database
			@name=res[0]
	#excute query
			stmt8=@connection.prepare("select from_city, to_city, payment from flite where flite_id=?")
			stmt8.execute(@flit_id)
	#fetch recorde
			while record=stmt8.fetch do
			@from_city=record[0]
			@to_city=record[1]
			@payment=record[2]
			end
	#print ticket details by fetching from database
			puts "\n\n\n\t\t\t\t$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
			puts "\n\t\t\t\t\t\t\tYour Ticket"
			puts "\n\t\t\t\t\tTicket No: #{@ticket_no}"
			puts "\n\t\t\t\t\tPassanger Name: #{@name}"
			puts "\n\t\t\t\t\tTravel From #{@from_city} To #{@to_city}"
			puts "\n\t\t\t\t\tYou had paied Rs. #{@payment}"
			puts "\n\t\t\t\t\t\tEnjoy Your Jurney.!!"
			puts "\n\t\t\t\t$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
		#call new ticket class
				Ticket.new
			rescue Mysql::Error=>e

			puts "Error in Connection-.....#{e}"

			ensure

			@connection.close if @connection

			end

	end

end
# call new ticket class
Ticket.new