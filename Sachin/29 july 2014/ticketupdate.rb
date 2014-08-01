
require "mysql"
require 'terminal-table'

class Ticketbook

	
	def initialize
		begin
			#Database connectivity
			@con=Mysql.connect("localhost","root","root")
			@con.query("create database if not exists\ Ticket")
			@con.query("use Ticket")

			@con.query("create table if not exists\ passengers(id int, name varchar(20), dob date, mobile varchar(20), email varchar(30))")
			@con.query("create table if not exists\ pass_payment(F_id int, amount int, s_city varchar(20), d_city varchar(20))")
			@con.query("create table if not exists\ pass_ticket(id int, tick_no int, F_id int)")
			
			stmtt=@con.query("select * from passengers")
        	stmttt=@con.query("select * from pass_payment")
        	stmtttt=@con.query("select * from pass_ticket")
			puts "\n\nConnect sucessfully to Database....."

			if (record1=stmttt.fetch_row).nil?
				@con.query("insert into pass_payment values(1,500,'mumbai','nashik'),
														(2,1000,'pune','goa'),
														(3,1500,'surat','banglore'),
														(4,2000,'delhi','chenai'),
														(5,2500,'mumbai','ranchi')")
			end
			#call main method
			menu	

			rescue Mysql::Error=>e

			puts "Error occured :#{e}"
			ensure 
			@con.close if @con
		end
	end

	#define main method to start the actual implementation
	def menu

		puts "\n\t\t1.Ticket booking \n\t\t2.Exit"
		print "\n\nEnter your choice :"
		ch=gets.to_i
		case ch

			when ch=1
			print "\n\n Register Customer Details...."
			name
				
			when ch=2
			@con.close if @con
			exit -1

			else
			puts "\n\t\t\t\tInvalid Choice!!!...Enter Correct\n\n"	
			menu
		end
			
	end
	#enter the content of the ticket reservation
	def name
		print "\n\n\t\tEnter the name :"
		name1= gets.chomp
		name_lengh=name1.length

		if (name1=~ /^[A-Za-z]+$/) and (name_lengh<20)
			@name1=name1
			dob
			else 
			puts "Invalid name...."
			name
		end
	end
	
	def dob

		print "\n\n\t\tEnter the Date of birth :"
		d_birth=gets.chomp
		d_lengh=d_birth.length

		if d_birth=~ /\d{4}+\/+\d{2}+\/+\d{2}/ and d_lengh<11
			@d_birth=d_birth
			mobile
			else
			puts "Invalid number...."
			dob
		end
	end 

	def mobile
		print "\n\n\t\tEnter the Mobile Number :"
		phone=gets.chomp
		p_length=phone.length
	     
   		if phone=~/\d{10}/ && p_length<11	  
			@phone=phone.to_i
			#puts @phone
			email1

			else
			puts "\nInvalid mobile number"
			mobile
		end
	end

	def email1

		print "\n\n\t\tEnter the Email Address :"
		email=gets
	
		if email=~ /[A-Za-z0-9]+@[A-Za-z]+.[A-Za-z]/
			@email=email
			register
			else

			puts "\nInvalid email address"
			email1
		end

	end

	def register
      	#afetch the data from database table passenger
		statmt=@con.query("select id from passengers ORDER BY id DESC LIMIT 1")
		rs=statmt.fetch_row
		if rs.nil?
			@id=1
			else
			id=rs[0]
			@id=id.next
		end
		# puts @phone.inspect
		statmt=@con.prepare("insert into passengers values(?,?,?,?,?)")
		statmt.execute(@id,@name1,@d_birth,@phone,@email)
		@con.commit
		puts "\n\n\t\t......Registation done successfully...!!!"

		result=@con.query("select * from pass_payment")
		#display the roots and amount
		puts "\n\n\t\t......Available roots......."
		table=Terminal::Table.new
        rows=[]
        while row=result.fetch_row do
			table.headings=['F_id','Amount','s_city','d_city']
			rows<<[row[0],row[1],row[2],row[3]]
		end
		table.rows=rows
		puts "#{table}"
		
		@con.commit
		city

	end

	#method city to enter the users source and destination
	def city
		print "\n\n\t\tEnter your source city : "
		s_city=gets.chomp;
		source=s_city.length

		if (s_city=~ /^[A-Za-z]+$/) and (source<20)

			print "\n\n\t\tEnter yout destination city : "
			d_city=gets.chomp;
			destination=d_city.length

			if (d_city=~ /^[A-Za-z]+$/) and (destination<20)

				@s_city=s_city
				@d_city=d_city
				reserv
				else 
				puts "Invalid destination city"
				city
			end
			else
			puts "Invalid source city"
			city
		end
	end

	def reserv
		stmtt=@con.prepare("select F_id, amount from pass_payment where s_city=? and d_city=?")
		stmtt.execute(@s_city,@d_city)
		#fetch the record from paa_payment table and print the details
		record=stmtt.fetch
		if record.nil?
			puts "\n\nno flight"
			city
			else
			@F_id=record[0]
			@amount=record[1]

			puts "\n\n\t\tyou are traveling to #{@s_city} to #{@d_city}"
			puts "\n\n\t\tyour amount bill is : #{@amount}"

			print "\n\nU whant to confirm your Ticket(y/n): "
			c=gets.chomp

			if c=='y'
				final_ticket
				else
				puts "......Thank you...."
				exit -1
			end
		end
	end

	def final_ticket
		#fetch the row from pass_ticket table
		stmttt=@con.query("select tick_no from pass_ticket ORDER BY tick_no  DESC LIMIT 1")
		rst=stmttt.fetch_row

		if rst.nil?
			@tick_no=1
			else
			tiket=rst[0]
			@tick_no=tiket.next
		end

		stmttt=@con.prepare("insert into pass_ticket values(?,?,?)")
		stmttt.execute(@id,@tick_no,@F_id)
		@con.commit
		puts "\n\nconfirmed Ticket...."
		printing
	end

	#print the ticket means all reauirement of ticket which is displyed in console
	def printing
		stmtttt=@con.prepare("select F_id from pass_ticket where tick_no=?")
		stmtttt.execute(@tick_no)
	
		stmttttt=@con.prepare("select name from passengers where id=?")
		stmttttt.execute(@id)
		res=stmttttt.fetch	
		@name1=res[0]
		stmts=@con.prepare("select s_city, d_city, amount from pass_payment where F_id=?")
		stmts.execute(@F_id)
		
		#fetch the record from pass_payemnt table
		while records=stmts.fetch do
		@s_city=records[0]
		@d_city=records[1]
		@amount=records[2]
		end
		
		puts "\n\t\t\t\t.....Your Ticket print...."
		puts "\n\t\t\t\tTicket Number: #{@tick_no}"
		puts "\n\t\t\t\tPassanger Name: #{@name1}"
		puts "\n\t\t\t\tTravel From #{@s_city} To #{@d_city}"
		puts "\n\t\t\t\tYour amount paied Rs. #{@amount}"
		puts "\n\t\t\t............................................\n\n"

		print "\n\nHave you want a book another ticket (y/n): "
		ch=gets.chomp
		if ch=='y'
			menu
		else
			puts "\n\n\t\tThank you !!!!\n\n"		
			exit -1	
		end
	end
end
Ticketbook.new