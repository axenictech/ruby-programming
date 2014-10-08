require "mysql" 


class Connection

	def insert
	begin
		
		con = Mysql.connect("localhost","root","source","Student")
		 puts "Connection Successfully"
		 puts "Enter First Name of Student"
		 fname=gets.chomp
		 puts "Enter Last Name of Student"
		 lname=gets.chomp

		
		 d =con.prepare"Insert into studentinfo(fname,lname) values (?,?)"
		 d.execute("#{fname}","#{lname}")
		 
		 r = con.query"select * from studentinfo"
		 n_rows = r.num_rows
    
    	puts "There are #{n_rows} rows in the result"
    
   		 n_rows.times do
       	 puts r.fetch_row.join("\s")
   		 end

	rescue Mysql::Error => e

		puts "Error occured in Connection...#{e}"
	ensure 

		con.close

	end
	end
end
Connection.new.insert