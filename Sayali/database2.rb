require "mysql"
class Database2
	def print
		begin
		@con=Mysql.connect("localhost","root","root","Axenic")

		@con.query("Create table if not exists \ demo (id int(5)primary key,name varchar(10))")
		puts "table Create"
		insert=@con.prepare("insert into demo(id,name)values (?,?)")
		insert.execute(4,"sai")
		insert.execute(5,"om")
         puts "inserted"
       r=@con.query("select * from demo")
         while row=r.fetch_row  do
         	puts row
         end 
        rescue Mysql::Error => e
        	puts e
        end
    end
   end
   Database2.new.print