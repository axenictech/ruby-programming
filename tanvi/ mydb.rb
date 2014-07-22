require "pg"

			begin
	
				connection=PGconn.open(dbname:'mydb')

				puts "Connection Successfully"

			rescue Exception => e
	
				puts "Error in connection.....#{e}"
			end
