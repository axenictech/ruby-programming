#using mysql database created booking ticket program

#use mysql model for connectivity
require "mysql"

class Ticket

	def initialize
	
		begin

	# mysql connectivity
			@connection=Mysql.connect("localhost","root","root","kanishk")
	#create database
			@connection.query("create database if not exists\ airlines")
	#use database
			@connection.query("use airlines")
	#create table for passenger
			@connection.query("create table if not exists\ passenger
				(id int(10) ,name varchar(20),dob date,mobile int,email varchar(20))")
			@connection.query("create table if not exists\ ticket
				(pass_id int(10),ticket_no int(10),flight_id int(10))")
			@connection.query("create table if not exists\ flight
				(from_city varchar(20),to_city varchar(20),payment int(10),flight_id int(10))")
	 statement=@connection.query("select * from flight")
	
			if (recordset=statement.fetch_row).nil?
					@connection.query("insert into flight values ('Mumbai','Pune',1000,1)")
					@connection.query("insert into flight values ('Mumbai','Banglore',1500,2)")
					@connection.query("insert into flight values ('Mumbai','Nagpur',2000,3)")
					@connection.query("insert into flight values ('Mumbai','Goa',500,4)")
					@connection.query("insert into flight values ('Mumbai','dubai',4000,5)")
					@connection.query("insert into flight values ('Mumbai','uk',7000,6)")
				

			end

			puts "\n\n\tBooking of Your flight\n\n"
			puts "\t1.Book Your Airline Tickets here \n\t2.Exit\n\n"
			menu

		rescue Mysql::Error=>e

			puts "Error in Connection-.....#{e}"

		ensure
			@connection.close if @connection

		end

	end
	def menu

		print "\tEnter Your Choice: "
		choice=gets.to_i

		case choice

			when choice=1
				puts "\n\n\tGive  All your information\n"
				register_name
			when choice=2
				@connection.close if @connection
				exit -1
			else
				puts "\n\tInvalid Choice!!!...Please Enter Correct\n\n"
				menu
		end
	end

	def register_name

		print "\n\n\tEnter Your Real Name: "
		name=gets.chomp
		name_size=name.length
		if (name=~ /^[A-Z a-z]+$/) and (name_size>2 and name_size<21)
			@name=name
			check_name_already_exits
			register_dob
		else
			puts "\n\n\tInvalid Name!!!...Enter Correct"
			register_name
		end
	end

	def check_name_already_exits
		stmtt=@connection.prepare("select id,name from passenger where name=?")
		stmtt.execute(@name)
		recordsett=stmtt.fetch
		if recordsett.nil?
		else
			puts "\n\n\t\tYou are already registerd...!!!"
			@id=recordsett[0]
			name=recordsett[1]
			puts "\n\n\tPassanger ID:- #{@id}"
			puts "\n\n\tPassanger Name:- #{name}"
			book
		end
	end
	def register_name

		print "\n\n\tEnter Your Name: "
		name=gets.chomp
		name_size=name.length
		if (name=~ /^[A-Z a-z]+$/) and (name_size>2 and name_size<21)
			@name=name
			check_name_already_exits
			register_dob
		else
			puts "\n\n\tInvalid Name!!!...Enter your Correct Name"
			register_name
		end
	end

	def check_name_already_exits
		stmtt=@connection.prepare("select id,name from passenger where name=?")
		stmtt.execute(@name)
		recordsett=stmtt.fetch
		if recordsett.nil?
		else
			puts "\n\n\tYou are already registerd...!!!"
			@id=recordsett[0]
			name=recordsett[1]
			puts "\n\n\tPassanger ID:- #{@id}"
			puts "\n\n\tPassanger Name:- #{name}"
			book
		end
	end

	def register_dob

		print "\n\n\tEnter Your DOB(yyyy/mm/dd): "
		dob=gets.chomp
		size=dob.length
		if dob=~ /\d{4}+\/+\d{2}+\/+\d{2}/ and size<11
			@dob=dob
			register_mobile
		else
			puts "\n\n\tInvalid Date!!!...Enter Correct"
			register_dob
		end
	end

	def register_mobile

		print "\n\n\tEnter Your Mobile No.: "
		mobile=gets
		size=mobile.length
		if mobile=~ /\d{10}/ and size<12
			@mobile=mobile.to_i
			register_email
		else
			puts "\n\n\tNot a valid Mobile No!!!...Enter Correct"
			register_mobile
		end
	end
	
	def register_email

		print "\n\n\tEnter Your current Email-Id: "
		email=gets
		if email=~ /^[a-z0-9._]+@[a-z]+\.[a-z]/
			@email=email
			register
		else
			register_email
		end
	end

	def register
			statmt=@connection.query("select id from passenger ORDER BY id DESC LIMIT 1")
			if(rs=statmt.fetch_row).nil?		
				@id=101
			else
				@id=rs[0].next
			end

			stmt=@connection.prepare("insert into passenger values(?,?,?,?,?)")
			stmt.execute(@id,@name,@dob,@mobile,@email)
			@connection.commit

			puts "\n\n\t You have registered Successfully...!!!"
			book
	end

	def book

		print "\n\n\tEnter your source city: "
		from_city=gets.chomp
		size=from_city.length
		if (from_city=~ /^[A-Z a-z]+$/) and (size>2 and size<21)
		
			print "\n\tEnter you destination city: "
		
			to_city=gets.chomp
		
			size1=to_city.length

				if (to_city=~ /^[A-Z a-z]+$/) and (size1>2 and size1<21)
					@from_city=from_city
					@to_city=to_city
					flite				
				else
					puts "\n\n\tInv city!!!...Enter Correct"
					book
				end
		else
			puts "\n\n\tInv city!!!...Enter Correct"
			book
		end
	end

	def flite

			stmt2=@connection.prepare("select flight_id, payment from flight where from_city=? and to_city=?")
			stmt2.execute(@from_city,@to_city)
			recordset=stmt2.fetch

				if recordset.nil? 
					puts "\n\n\tAt present no Flights Available!!!...Please Try again"
					book_again
				else

					@flite_id=recordset[0]
					@payment=recordset[1]
					
					puts "\n\n\tYour Journey is from #{@from_city} to #{@to_city}"
					puts "\n\t\tGive the payment of Rs. #{@payment}"
					confirm
				end	
	end

	def book_again

			print "\n\tDo you want continue to book ticket(y/n)?: " 
				
					ch=gets.chomp
				
					if ch=="y"
						book
					elsif ch=="n"
						puts "\n\tThanks !!!"
						Ticket.new
					else
						puts "\n\n\tInvalid Choice!!!...Try again"
						book_again
					end	
	end

	def confirm

		print "\n\tAre you sure to confirme book ticket(y/n)?: " 
		ch=gets.chomp
		if ch=="y"
			puts "\n\t\Please pay your payment Rs. #{@payment}"
			ticket
		elsif ch=="n"
			puts "\n\tThanks!!!"
			Ticket.new
		else
			puts "\n\n\tInvalid Choice!!!...Please Try again"
			confirme
		end	
     end
    def ticket

			stmt3=@connection.query("select ticket_no from ticket ORDER BY ticket_no  DESC LIMIT 1")
			if(rs=stmt3.fetch_row).nil?		
				@ticket_no=101011
			else
				@ticket_no=rs[0].next
			end
			stmt4=@connection.prepare("insert into ticket values(?,?,?)")
			stmt4.execute(@id,@ticket_no,@flight_id)
			@connection.commit

			puts "\n\tYour ticket is confirme...."
			print_ticket
	end

	def print_ticket

			stmt6=@connection.prepare("select pass_id, flight_id from ticket where ticket_no=?")
			stmt6.execute(@ticket_no)
			recs=stmt6.fetch
			@pass_id=recs[0]			
			@flite_id=recs[1]
			stmt7=@connection.prepare("select name from passenger where id=?")
			stmt7.execute(@pass_id)
			res=stmt7.fetch	
			@name=res[0]
			stmt8=@connection.prepare("select from_city, to_city, payment from flight where flight_id=?")
			stmt8.execute(@flight_id)

			while record=stmt8.fetch do
			@from_city=record[0]
			@to_city=record[1]
			@payment=record[2]
			end
			puts "\n\n\n\t@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			puts "\n\t\tYour Ticket is Confirmed"
			puts "\n\t\tTicket No: #{@ticket_no}"
			puts "\n\t\tName of Passenger: #{@name}"
			puts "\n\t\tJourney From #{@from_city} To #{@to_city}"
			puts "\n\t\tYou had paid. #{@payment}"
			puts "\n\t\tHave a Safe and happy journey.!!"
			puts "\n\t\t@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

			book_plus
	end
        def book_plus

		print "\n\n\t\t\t\tDo you want some other ticket(y/n)"
		choice=gets.chomp

		if choice=="y"
			book
		elsif choice=="n"
			puts "\n\t\t\t\tThanks!!!"
			Ticket.new
		else
			puts "\n\n\t\t\t\tInvalid entry!!!...Try again"
           book_plus
		end	
	end
end
Ticket.new
