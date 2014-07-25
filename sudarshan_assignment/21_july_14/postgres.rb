
# pg model for doing connection with postgres
require "pg"

begin
	
#use PGconn class for connection (localhost,port,'','',database,user,password)
	connection=PGconn.connect("localhost",5432,'','',"test", "root","root")

	puts "Connection Successfully"

	print "\nEnter your Id: "
	id=gets.to_i

	print "\nEnter your Name: "
	name=gets
#excute query
	connection.query("insert into student values(#{id},'#{name}')")

	puts "\nRecorde inserted Successfully\n"
#fetch record in recordset
	recordset=connection.exec("select * from student")

	recordset.each do |row|
		puts
		row.each do |column|
			print column
			puts
		end
	end

rescue Exception => e
	
	puts "Error in connection.....#{e}"

ensure

	
	connection.close if connection

end
