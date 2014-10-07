require "mysql"  	#this mysql module provided by mysql to use for connectivity

begin
				
	connection=Mysql.connect("localhost","root","root","Demo")

	com=connection.query("select * from student")

	while row=com.fetch_row do
		puts row
	end

rescue Mysql::Error=> e   #rescue useing for exception handling and Mysql::Error is exception class
			    
    puts "Error in Connection.....#{e}"

ensure                     #ensure is like final block in java
			
	connection.close if connection

end
