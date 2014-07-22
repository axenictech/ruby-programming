
require "mysql"

class Axenic

	def initialize
		begin

			@connection=Mysql.connect("localhost","root","mysql","Testdb")
			
			puts "\n\n\t\t\t\tWelcome To Axenic Technology\n\n"
			puts "\t\t\t\t\t1.Login\n\t\t\t\t\t2.Register\n\t\t\t\t\t3.Exit\n\n"
			
			menu

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
				login
			when choice=2
				puts "\n\n\t\t\t\tRegister here...Fill all data\n"
				register_fname
			when choice=3
				@connection.close if @connection
				exit -1
			else
            	puts "\n\t\t\t\tInvalid Choice!!!...Enter Correct\n\n"
            	menu
		end
	
	end

	def login
		begin

			print "\n\n\t\t\t\tEnter Your Id: "
			id=gets

			if id=~ /\d/

				statmt=@connection.prepare("select fname, password from axenic where id=?")
				statmt.execute(id)

				while rs=statmt.fetch do
					
					name=rs[0]				
					password=rs[1]				
				end
				
				pass=password.nil?
				
				if pass==false

					print "\n\n\t\t\t\tEnter Your Password: "
					passw=gets.to_s

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

		if (fname=~ /^[A-Z a-z]+$/) and (fname_size>3 and fname_size<22)
			@fname=fname
			register_lname
		else
			puts "\n\n\t\t\t\tInvalid Name!!!...Enter Correct"
			register_fname
		end
	end

	def register_lname

		print "\n\n\t\t\t\tEnter Your Last Name: "
		lname=gets
		lname_size=lname.length

		if (lname=~ /^[A-Z a-z]+$/) and (lname_size>3 and lname_size<22)
			@lname=lname
			register_dob
		else
			puts "\n\n\t\t\t\tInvalid Name!!!...Enter Correct"
			register_lname
		end
	end

	def register_dob

		print "\n\n\t\t\t\tEnter Your DOB(dd/mm/yyyy): "
		dob=gets
		size=dob.length
		puts size
		if dob=~ /\d{2}+\/+\d{2}+\/+\d{4}/ and size<12
			@dob=dob
			register_email
		else
			puts "\n\n\t\t\t\tInvalid Date!!!...Enter Correct"
			register_dob
		end
	end

	def register_email

		print "\n\n\t\t\t\tEnter Your Email-Id: "
		email=gets

		if email=~ /^[a-z0-9._]+@[a-z]+\.[a-z]/
			@email=email
			register_password
		else
			puts "\n\n\t\t\t\tInvalid Email-Id!!!...Enter Correct"
			register_email
		end
	end

	def register_password

		print "\n\n\t\t\t\tEnter Your Password: "
		password=gets
		pass_size=password.length.to_i

			if (pass_size>5 and pass_size<20)
				
				print "\n\n\t\t\t\tEnter Confirm Password: "
				password1=gets

				match=password.eql? password1
				if match==true
					@password=password
					register_contact
				else
					puts "\n\n\t\t\t\tPassword Not Match!!!...Try again"
					register_password	
				end			
			else
				puts "\n\n\t\t\t\tEnter Minimum 5 character!!!...Try again"
				register_password
			end
	end

	def register_contact

		print "\n\n\t\t\t\tEnter Your Mobile No.: "
		contact=gets
		size=contact.length
		puts size
		if contact=~ /\d{10}/ and size<12
			@contact=contact.to_i
			register
		else
			puts "\n\n\t\t\t\tInvalid Mobile No!!!...Enter Correct"
			register_contact
		end
	end

	def register
		begin

			statmt=@connection.prepare("select id from axenic")
			statmt.execute

			while rs=statmt.fetch do
				
				id=rs[0]				
			end
			
			@id=id+1

			stmt=@connection.prepare("insert into axenic values(?,?,?,?,?,?,?)")
			stmt.execute(@id,@fname,@lname,@dob,@email,@password,@contact)
			@connection.commit

			puts "\n\n\t\t\t\t\tRegister Successfully...!!!"

			puts "\n\n\t\t\t\t\tYour Id: #{@id}"	
			puts "\n\t\t\t\t\tYour Password: #{@password}"	

			puts "\n\n\t\t\t\t\t1.Login\n\t\t\t\t\t2.Register\n\t\t\t\t\t3.Exit\n\n"
			
			menu

		rescue Mysql::Error=>e

			puts "Error in Connection-.....#{e}"

		ensure

			@connection.close if @connection

		end

	end
end

Axenic.new