require "pg"

class Postgrs

	def print

		begin
		 connection=PGconn.connect( "localhost",5432,'','',"emp", "gayatri","gayatri")

		 puts "Connection Successfully"
		 id = gets.to_i
		 puts "Enter Name of Employee"
		 name=gets.chomp
		 puts "Enter Salary of Employee"
		 salary=gets.to_i

		
		 d =connection.query "insert into employee(id,ename,salary) values ('#{id}','#{name}','#{salary}')"
		 

	rescue  Exception => e

		puts "Error occured in Connection..#{e}"

	ensure 

		connection.close() if connection

	end
	end
end
Postgrs.new.print