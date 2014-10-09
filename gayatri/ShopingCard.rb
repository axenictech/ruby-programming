require "mysql" 
#require "rubygems"
#require "highline/import"

class Shop

	def initialize

		begin
		
		@conn = Mysql.connect("localhost","root","source")
		 puts "Connection Successfully"
		@conn.query("CREATE DATABASE IF NOT EXISTS \ shopingcards")
		puts "Database Created Successfully"
		@conn.query("USE shopingcards")
		puts"Database Changed"
		
		# Login table
		@conn.query("CREATE  table IF NOT EXISTS\ login(id integer primary key auto_increment, uname varchar(20) , password varchar(20))")

		r = @conn.query("select * from login")

		if (rset=r.fetch_row).nil?

			@conn.query"Insert into login(uname,password)values('admin','admin'),
															   ('owner','owner')"
			
			puts "Data Inserted Successfully"
		end

		# Products
		@conn.query("CREATE table IF NOT EXISTS\ products(pid integer primary key auto_increment,pname varchar(20), cost varchar(20) ,numofstock integer)")
		#order
		@conn.query("CREATE  table IF NOT EXISTS\ orders(oid integer primary key auto_increment,quantity integer,pid integer ,foreign key(pid) REFERENCES products(pid))")
		#User
		@conn.query("CREATE  table IF NOT EXISTS\ users(uid integer primary key auto_increment, uname varchar(20),oid integer ,foreign key(oid) references orders(oid))")
		#bill
		@conn.query("CREATE  table IF NOT EXISTS\ bill(bid integer primary key auto_increment, total integer ,uid integer ,foreign key (uid)  REFERENCES users(uid))")
		puts "Tables are Created"

		addproduct

		rescue Mysql::Error => e

		puts "Error occured in Connection...#{e}"
		ensure 

		@conn.close if @conn

		end
	end

	def addproduct

		puts "Enter Product Name :"
		productname=gets.chomp
		#puts productname
		puts "Enter Prize of Entered Product :"
		prize=gets.to_i
		#puts prize
		puts "Enter the Quantity of Product"
		stock=gets.to_i
		#puts stock
	    @conn.query("insert into products(pname,cost,numofstock) values ('#{productname}',#{prize},#{stock})")
		
		puts "Product Inserted"

		usershoping
	end


	def usershoping

		puts "Welcome to AnthingShop :)"

		puts "---------------Products List in our Shop-----------------"

		r = @conn.query"select pname,cost,numofstock from products"
		n_rows = r.num_rows
    	#puts "There are #{n_rows} rows in the result"
    	
    	print "Product Name  Product Prize  Available Stock"
    
		 n_rows.times do
       	 puts r.fetch_row.join("\s")
   		end

   		puts "Do you Want to Purchase Some Product [y/n]"

   		schk = gets.chomp
		if schk.eql?"y"
		 
				
				puts "Enter the Your Name:"
				name=gets.chomp
			
				puts "Please Enter the Product Name which you want to buy:"
				productname=gets.chomp

				puts "Enter the Quantity of Products you Want :"
				quantity=gets.to_i
				
				@conn.query("Insert into orders(quantity,pid) values(#{quantity},(select pid from products where pname='#{productname}'))")
				puts "b4 user"
				@conn.query("Insert into users(uname,oid) values('#{name}',(select oid from orders where pid =(select pid from products where pname='#{productname}')))")
				puts"Order Submited Successfully !"

				showUserOrder

				puts "Do you want to Purchase More : [y/n]"

				check = gets.chomp

				if check.eql?"y"

					 usershoping

				else

				puts "in exit"

				end 
			else 
				puts "in exit"
		end
	end

	def showUserOrder

		r = @conn.query"select * from users"
		n_rows = r.num_rows
    
    	puts "You Purchased #{n_rows} Products"
    
   		 n_rows.times do
       	 puts r.fetch_row.join("\s")
   		 end

   		puts "Thank You !"

	end

	def login

		puts "----------------------------Login------------------------------"
		puts "Username :"
		user = gets.chomp
		puts "Password :"
		pass = gets.chomp { |pass| pass.echo = "*" }

		r=@conn.query("select * from login")
		result = r.fetch_row
		if (user.eql?result)

		elsif 
			puts "Enter valid Username"
		end
			

	end
end 
var = Shop.new


