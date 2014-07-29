require "mysql"

class Shoppingcart

	#initialize the method
	def initialize
		begin
			#connect to database
			@con=Mysql.connect("localhost","root","root","Data")

			#create a table of products
			stamt=@con.query("create table if not exists\ products(prod_id int primary key, prod_name varchar(20), price int)")
			puts "\n\t\t******Shopping Mall*******"
			result=@con.query("select * from products")
			#if row is null then insert the items
			row=result.fetch_row
			
			if row.nil?
				stamt1=@con.query("insert into products values(1,'shirt',200),
													(2,'jeans',1200),
													(3,'trouser',1000),
													(4,'shoes',1500),
													(5,'T-shirt',800)")
				else	
				result1=@con.query("select * from products")	

				#print the available products in mall
				puts "\n\n\t\t......Available products......."
				puts "\n\n\tProduct ID\t\tProduct name\t\tAmount\n"
				#fetch the products table row from database
				while aa=result1.fetch_row do

					puts "\t #{aa[0]}\t\t\t#{aa[1]}\t\t\t#{aa[2]}"
				end
			end
			@con.commit
			#call  the confirmation of products method
			confirm_products

			#throw an exception ,if occure and print by #{e}
			rescue Mysql::Error=>e
			puts "connection error: #{e}"
			ensure 
			@con.close if @con
		end
	end 

	#method confirm_products start
	def confirm_products

		#create a table confirm_products which we have selected from the list in table products
		stamt3=@con.query("create table if not exists\ confirm_products(con_id int, con_name varchar(20), con_price int)")

		#Enter product id which you want
		print "\n\nEnter the product id : "
		@p_id=gets.to_i

		#insert the data which we had selected from products table
		stamt4=@con.prepare("insert into confirm_products (con_id,con_name,con_price) select prod_id,prod_name,price from products where prod_id=? ")
		stamt4.execute(@p_id)
		@con.commit

		#add more products
		print "Do you want a add more products (y/n):"
		ch=gets
		if (ch=~/^[y]+$/) then
			confirm_products
			else
			conf_result=@con.query("select * from confirm_products")

			#print the data(cart) which we had selected from products table
			puts "\n\n\t\t*****************Your Selected Items*****************"
			puts "\n\t\tProduct id\t\tProduct_Name\t\tAmount"
			while aa=conf_result.fetch_row do
				puts "\t\t#{aa[0]}\t\t\t#{aa[1]}\t\t\t#{aa[2]} \n\n"
			end
		end
		resultdelete=@con.query("truncate table confirm_products")
		@con.commit
	end
end
Shoppingcart.new