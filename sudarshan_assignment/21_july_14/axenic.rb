
require "mysql"

class Axenic

	def initialize
		begin

#connect to mysql database
			@connection=Mysql.connect("localhost","root","mysql","Testdb")
			
			puts "\n\n\t\t\t\tWelcome To Axenic Technology\n\n"
			puts "\t\t\t\t\t1.Login\n\t\t\t\t\t2.Register\n\t\t\t\t\t3.Exit\n\n"
#calling menu method
			menu
#used mysql exception
		rescue Mysql::Error=>e

			puts "Error in Connection-.....#{e}"

		ensure

			@connection.close if @connection

		end

	end

	def menu

		print "\t\t\t\tEnter Your Choice: "
		choice=gets.to_i

		case choice

			when choice=1
				
		# calling login method
				login
			when choice=2
				puts "\n\n\t\t\t\tRegister here...Fill all data\n"
		# calling register_fname method
				register_fname
			when choice=3
				@connection.close if @connection
		# used exit -1 to end the program
				exit -1
			else
            	puts "\n\t\t\t\tInvalid Choice!!!...Enter Correct\n\n"
        # calling menu method
            	menu
		end
	
	end

	def login
		begin

			print "\n\n\t\t\t\tEnter Your Id: "
			id=gets

		# check id is number?
			if id=~ /\d/

		# useing statement to excute query
				statmt=@connection.prepare("select fname, password from axenic where id=?")
				statmt.execute(id)

		# used recoedset to fetch data
				while rs=statmt.fetch do
					
					name=rs[0]				
					password=rs[1]				
				end
		
		# check password is nil?
				pass=password.nil?
				
				if pass==false

					print "\n\n\t\t\t\tEnter Your Password: "
					passw=gets.to_s

			# check password is equal to password that in database
					match=passw.eql? password
					
					if match==true

						puts "\n\n\t\t\t\t\tYour are Login Successfully...!!!"	

						puts "\n\n\t\t\t\t\t\tWelcome #{name}\n"
						puts "\t\t\t\t\tDate: #{Time.now}\n\n\n"			
					else

						puts "\n\n\t\t\t\tWronge Password!!!...Try again!!!"
						login

					end
				else
					puts "\n\n\t\t\t\tInvalid Id!!!...Please register First!!!"	

					puts "\n\n\t\t\t\t\t1.Login\n\t\t\t\t\t2.Register\n\t\t\t\t\t3.Exit\n\n"
			
					menu

				end		
			
			else
				puts "\n\n\t\t\t\tWronge Id!!!...Enter Correct"
				login
			end

		rescue Mysql::Error=>e

			puts "Error in Connection-.....#{e}"

		ensure

			@connection.close if @connection

		end

	end

	def register_fname

		print "\n\n\t\t\t\tEnter Your First Name: "
		fname=gets
		fname_size=fname.length

	# check first name is string and giving limit charater
		if (fname=~ /^[A-Z a-z]+$/) and (fname_size>3 and fname_size<22)
	#assign this first name values to instace variable
			@fname=fname
	#calling register_lname method
			register_lname
		else
			puts "\n\n\t\t\t\tInvalid Name!!!...Enter Correct"
	#calling register_lname method
			register_fname
		end
	end

	def register_lname

		print "\n\n\t\t\t\tEnter Your Last Name: "
		lname=gets
		lname_size=lname.length
	# check last name is string and giving limit charater
		if (lname=~ /^[A-Z a-z]+$/) and (lname_size>3 and lname_size<22)
	#assign this last name values to instace variable
			@lname=lname
	#calling register_dob method
			register_dob
		else
			puts "\n\n\t\t\t\tInvalid Name!!!...Enter Correct"
	#calling register_lname method
			register_lname
		end
	end

	def register_dob

		print "\n\n\t\t\t\tEnter Your DOB(dd/mm/yyyy): "
		dob=gets
		size=dob.length
		puts size

	# check dob is valid date?
		if dob=~ /\d{2}+\/+\d{2}+\/+\d{4}/ and size<
	#assign this dob values to instace variable
			@dob=dob
	#calling register_email method
			register_email
		else
			puts "\n\n\t\t\t\tInvalid Date!!!...Enter Correct"
	#calling register_dob method
			register_dob
		end
	end

	def register_email

		print "\n\n\t\t\t\tEnter Your Email-Id: "
		email=gets
	# check email is valid email?
		if email=~ /^[a-z0-9._]+@[a-z]+\.[a-z]/
	#assign this email values to instace variable
			@email=email
	#calling register_password method
			register_password
		else
			puts "\n\n\t\t\t\tInvalid Email-Id!!!...Enter Correct"
	#calling register_email method
			register_email
		end
	end

	def register_password

		print "\n\n\t\t\t\tEnter Your Password: "
		password=gets
		pass_size=password.length.to_i


	# check password have length greater than 5?
			if (pass_size>5 and pass_size<20)
				
				print "\n\n\t\t\t\tEnter Confirm Password: "
				password1=gets
		# match password is eql to confrm password?
				match=password.eql? password1
				if match==true
			#assign this password values to instace variable
					@password=password
			#calling register_contact method
					register_contact
				else
					puts "\n\n\t\t\t\tPassword Not Match!!!...Try again"
			#calling register_password method
					register_password	
				end			
			else
				puts "\n\n\t\t\t\tEnter Minimum 5 character!!!...Try again"
		#calling register_password method
				register_password
			end
	end

	def register_contact

		print "\n\n\t\t\t\tEnter Your Mobile No.: "
		contact=gets
		size=contact.length
		puts size

	# check contact is digit and haveing length 10?
		if contact=~ /\d{10}/ and size<12

	#assign this contact values to instace variable
			@contact=contact.to_i
		#calling register method
			register
		else
			puts "\n\n\t\t\t\tInvalid Mobile No!!!...Enter Correct"
		#calling register_contact method
			register_contact
		end
	end

	def register
		begin

	# using statement excute query
			statmt=@connection.prepare("select id from axenic")
			statmt.execute

	# fetch recorde in recordset
			while rs=statmt.fetch do
				
				id=rs[0]				
			end
	# increment value od id by 1
			@id=id.next

	# using statement excute query
			stmt=@connection.prepare("insert into axenic values(?,?,?,?,?,?,?)")
			stmt.execute(@id,@fname,@lname,@dob,@email,@password,@contact)
	# commit data in database
			@connection.commit

			puts "\n\n\t\t\t\t\tRegister Successfully...!!!"

			puts "\n\n\t\t\t\t\tYour Id: #{@id}"	
			puts "\n\t\t\t\t\tYour Password: #{@password}"	

			puts "\n\n\t\t\t\t\t1.Login\n\t\t\t\t\t2.Register\n\t\t\t\t\t3.Exit\n\n"
	# calling menu mehtod
			menu

		rescue Mysql::Error=>e

			puts "Error in Connection-.....#{e}"

		ensure

			@connection.close if @connection

		end

	end
end

Axenic.new