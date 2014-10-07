require "mysql"
require "terminal-table"
class Shopping
	def show
		begin
			connection=Mysql.connect("localhost","root","root","test")
			rs = connection.query("select * from seller")  
			rows=[]
			table=Terminal::Table.new
			while row=rs.fetch_row do
				rows<<row
			end
			table.rows=rows
			puts table
			connection.commit
			rescue Mysql::Error=> e   
			    puts "Error in Connection.....#{e}"
			ensure                     
				connection.close if connection
		end
	end

	def add(pid)
		begin
			connection=Mysql.connect("localhost","root","root","test")
			rs1 = connection.prepare("select * from seller where id = ?")  
			rs=rs1.execute("#{pid}")
			row=rs.fetch
            bproduct=row[1]
            bprice=row[2]
            print "ENTER THE QUANTITY : "
    		bquantity=gets.to_i
    		total=bquantity*bprice
    		puts "#{bproduct}"
            puts "#{bprice}"
            puts "#{bquantity}"
            puts "#{total}"

            statement=connection.prepare("insert into buyer(bproduct,bprice,bquantity,total) values(?,?,?,?)")
			statement.execute("#{bproduct}","#{bprice}","#{bquantity}","#{total}")
			puts "ADDED SUCCESSFUL!!"
			connection.commit
			rescue Mysql::Error=> e   
			    puts "Error in Connection.....#{e}"
			ensure                     
				connection.close if connection
		end
	end

	def del(did)
		begin
			connection=Mysql.connect("localhost","root","root","test")
			rs1 = connection.prepare("delete from buyer where id = ?")  
			rs=rs1.execute("#{did}")
			puts "DELETED SUCCESSFULY"
			
			connection.commit
			rescue Mysql::Error=> e   
			    puts "Error in Connection.....#{e}"
			ensure                     
				connection.close if connection
		end
	end

	def update(uid)
		begin
			connection=Mysql.connect("localhost","root","root","test")

			rs1 = connection.prepare("select * from buyer where id = ?")  
			rs=rs1.execute("#{uid}")
			row=rs.fetch
            bproduct=row[1]
            bprice=row[2]
            print "ENTER THE QUANTITY : "
    		bquantity=gets.to_i
    		total=bquantity*bprice

			rs1 = connection.prepare("update buyer set bprice = ?,bquantity = ?,total = ? where id = ?")  
			rs=rs1.execute("#{bprice}","#{bquantity}","#{total}","#{uid}")
			puts "UPDATED SUCCESSFULY"
			
			connection.commit
			rescue Mysql::Error=> e   
			    puts "Error in Connection.....#{e}"
			ensure                     
				connection.close if connection
		end
	end

	def bshow
		begin
			connection=Mysql.connect("localhost","root","root","test")
			rs = connection.query("select * from buyer")  
			rows=[]
			table=Terminal::Table.new
			while row=rs.fetch_row do
				rows<<row
			end
			table.rows=rows
			puts table

			gtotal = connection.query("SELECT SUM(total) FROM buyer")  
			gtotal.each_hash { |h| puts h}
			

			connection.commit
			rescue Mysql::Error=> e   
			    puts "Error in Connection.....#{e}"
			ensure                     
				connection.close if connection
		end
	end
end

shop=Shopping.new

while true do
p"----------------------------------------------------------"
puts "WELCOME TO SHOPPING CART"
p"----------------------------------------------------------"
puts "1.BUY PRODUCT"
puts "2.DELETE PRODUCT"
puts "3.UPDATE QUANTITY"
puts "4.DISPLAY SHOPPING CART"
puts "5.EXIT"
p"----------------------------------------------------------"
print "Enter your choice : "
ch=gets.to_i

case ch
when 1
	p"----------------------------------------------------------"
	puts "AVAILABLE ITEM"
	shop.show
    print "SELECT YOUR PRODUCT : "
    pid=gets.to_i
    shop.add(pid)
    

when 2
	p"----------------------------------------------------------"
	puts "BUYER SHOPPING CART"
	shop.bshow
	print "WHICH PRODUCT YOU WANT TO REMOVE : "
	did=gets.to_i
    shop.del(did)
    
when 3
    p"----------------------------------------------------------"
	puts "BUYER SHOPPING CART"
	shop.bshow
	print "WHICH PRODUCT QUANTITY YOU WANT TO CHANGE : "
	uid=gets.to_i
    shop.update(uid)
    
when 4
	p"----------------------------------------------------------"
	puts "BUYER SHOPPING CART"
	shop.bshow
    
else
    puts "work"
    
end

end