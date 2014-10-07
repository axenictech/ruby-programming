require "mysql" 

class Shop

	def db

		begin
		
		@conn = Mysql.connect("localhost","root","source")
		 puts "Connection Successfully"
		@conn.query("Create Database if not exits \ shopingcard")
		@conn.query("use Database")
		puts "Database Created Successfully"
		# Login table
		@conn.query("Create table if not exits \ login(id integer primary key auto_increment, uname varchar(20) , password varchar(20))")
		# Products
		@conn.query("Create table if not exits \ products(pid integer primary key auto_increment,pname varchar(20), cost varchar(20) ,numofstock integer)")
		
		#User
		@conn.query("Create table if not exits \ user(uid integer primary key auto_increment, uname varchar(20) , orderid foreign key REFERENCES order(oid))")
		#order
		@conn.query("Create table if not exits \ order(oid integer primary key auto_increment, productid foreign key REFERENCES products(pid) , quantity integer)")
		#bill
		@conn.query("Create table if not exits \ bill(bid integer primary key auto_increment,userid foreign key REFERENCES user(uid) , total integer)")
		puts "Tables are Created"

		rescue Mysql::Error => e

		puts "Error occured in Connection...#{e}"
		ensure 

		con.close

		end
	end

	def log

		l = @conn.prepare("insert into login(uname,password)values(?,?)")
		l.execute("admin","admin")
		l.execute("owner","owner")
		puts "Data Inserted Successfully"

	end

	def ow

		puts "Enter Product Name :"
		productname=gets.chomp
		puts "Enter Prize of Entered Product :"
		prize=gets.to_f
		puts "Enter the Quantity of Product"
		p = @conn.prepare("insert into products(pname,cost) values (?,?)")
		p.execute("#{productname},#{prize}")
		puts "Product Inserted"
	end

	def usershoping

		puts "Welcome to AnthingShop :)"

		puts "---------------Products List in our Shop-----------------"

		r = @conn.query"select pname,cost,numofstock from products"
		n_rows = r.num_rows
    	puts "There are #{n_rows} rows in the result"
    	
    	print "Product Name  Product Prize  Available Stock"
    
		 n_rows.times do
       	 puts r.fetch_row.join("\s")
   		end

   		puts "Do you Want to Purchase Some Product[y/n]"

   		schk = gets.chomp
		if schk.eql?"y"
			
			def add
				puts "Enter the Your Name:"
				name=gets.chomp
				puts "Please Enter the Product Name which you want to buy:"
				productname=gets.chomp
				puts "Enter the Quantity of Products you Want :"
				quantity=gets.to_i
				a1 = @conn.prepare("insert into user(uname) values (?)")
				a1.execute("#{name}")
				a2 = @conn.prepare("insert into order(productid,quantity)")

			end


			userchoice = case 
		
		else 
			puts "in exit"
		end



   	end



