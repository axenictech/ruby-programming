require "pg"

begin
	
	connection=PGconn.connect( "localhost",5432,'','',"test", "root","root")

	puts "Connection Successfully"

rescue Exception => e
	
	puts "Error in connection.....#{e}"
end
