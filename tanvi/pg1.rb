require "pg"

			begin
	
				connection=PGconn.open(dbname:'mydb')

				puts "Connection Successfully"
				#result=connection.exec("select * from emp")
				result=connection.exec("select * from axenic,tech")  

				result.each do |row|
					row.each do |column|
					p column
					puts
				end
				end


			rescue Exception => e
	
				puts "Error in connection.....#{e}"
			end
