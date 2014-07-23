require 'pg'

  
			begin
	
				connection=PGconn.connect( "localhost",5432,'','',"axenic", "<sai>","tanvi")

				puts "Connection Successfully"

			rescue Exception => e
	
				puts "Error in connection.....#{e}"
			end
