require "mysql"
require "terminal-table"
class Cart
	def connect
		begin
			@con=Mysql.connect("localhost","root","root","Axenic")
			@con.query("create table IF NOT EXISTS \ Menu(menuId int(10) primary key,menuName varchar(20),menuPrice int(10),menuQuantity int(20));")
				puts "Menu table create"
		     result=@con.query("select * from Menu")

		     if row=result.fetch_row.nil?
		    i=@con.prepare("insert into Menu(menuId,menuName,menuPrice,menuQuantity)values(?,?,?,?)")
		    	i.execute(1,"Milk",20,10)
		    	i.execute(2,"Bread",10,20)
		    	i.execute(3,"Sugar",40,5)
		    	i.execute(4,"Coffee",35,10)
		    	i.execute(5,"Biscuits",25,100)
		    	i.execute(6,"Chocolate",2,30)
		    end
		    puts "Menu Inserted.."
		 
		    res=@con.query("select * from Menu")
	       rows=[]
	       table=Terminal::Table.new

	    while row=res.fetch_row do
	    	rows<<row
	    end
	    		table.rows=rows
	    		puts table

		rescue Mysql::Error => e
	        	puts e
	        
	    end
	end
end
Cart.new.connect