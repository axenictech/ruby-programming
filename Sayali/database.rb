require "mysql"
class Database
	def print
		begin
			@c=Mysql.connect("localhost","root","root","Axenic")
			res=@c.query("select * from student")
			while row=res.fetch_row do 
				puts row
			end
		rescue Mysql::Error=>e  
			puts e  

		
		end
	end
end
Database.new.print