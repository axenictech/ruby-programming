#shoping card with mysql database

#mysql module for connectivity 
require "mysql"
#terminal-table module for table formate
require "terminal-table"
#prawn module to generate pdf document
require "prawn" 
#prawn/table to save table in pdf
require "prawn/table"

class Mall

	def initialize
	
		begin
	#connect to mysql database
			@connection=Mysql.connect("localhost","root","mysql")
	#create database
			@connection.query("create database if not exists\ shoping_cart")
	#use database
			@connection.query("use shoping_cart")
	#create table for products
			@connection.query("create table if not exists\ products
				(p_id int primary key,p_name varchar(20),p_stock int, p_price int)")
	#create table for shoping cards
			@connection.query("create table if not exists\ cards
				(user_id int,card_no int, primary key (user_id,card_no))")
	#create table for inline products for shoping cards
			@connection.query("create table if not exists\ inline_products
				(card_no int,p_id int,quantity int, foreign key(p_id) references products(p_id))")
	#create table for users
			@connection.query("create table if not exists\ users
				(user_id int,user_name varchar(50),user_add varchar(50),user_mobile int,
					foreign key(user_id) references cards(user_id))")
	#create table for order
			@connection.query("create table if not exists\ order_buys
				(card_no int,order_id int primary key,total int)")
	#fetch recorde from products
			statement=@connection.query("select * from products")
	#check recodset in null
			if (recordset=statement.fetch_row).nil?
		#if recodset null insert values into product
					@connection.query("insert into products values 
										(1,'T-shirt',20,500),
										(2,'Cricket-bat',20,1000),
										(3,'Football',20,400),
										(4,'Mobile',20,10000),
										(5,'Laptop',20,30000),
										(6,'Shoes',20,300),
										(7,'Goggales',20,800),
										(8,'Jeans',20,1000),
										(9,'Pendrive',20,400),
										(10,'Bages',20,200)")
			end

			puts "\n\n\t\tWelcome To Inorbit Mall"
	#call auto_increment method
			auto_increment
	#call menu method
			menu
		rescue Mysql::Error=>e

			puts "Error in Connection-.....#{e}"

		ensure
			@connection.close if @connection

		end

	end
#to generate card no and user id
	def auto_increment
#fetch last card no and user id form record
		statement2=@connection.query("select card_no,user_id from cards ORDER BY card_no DESC LIMIT 1")
#check recorde is null
		if (recordset2=statement2.fetch_row).nil?
	#if record set null assign default value to instance variable card no and user id
			@card_no=101
			@user_id=1111
		else
	#if record set not null assign next value to instance variable
			@card_no=recordset2[0].next
			@user_id=recordset2[1].next
		end
	#insert values into shoping cards
		statement4=@connection.prepare("insert into cards values(?,?)")
		statement4.execute(@user_id,@card_no)
		@connection.commit
	end

	def menu
#fetch record from products wher stock is not zero
		statement=@connection.query("select * from products where p_stock > 0")
	#declar count for product
			@count=0
	#declare rows as array 
			rows=[]
	#use terminal table for table formate
			table=Terminal::Table.new
	#heading is method of Table
			table.headings=["Product Id","Product Name","Product Price","Product Stock"]
			
		while recordset=statement.fetch_row do
	#use row array to insert record set into rows
			rows<<[recordset[0],recordset[1],recordset[3],recordset[2]]
	#count products
			@count+=1
		end
	#insert rows array in to table rows
		table.rows=rows
	#print table
		puts "\n#{table}"
	#call choice_select method
		choice_select
	end
#to get user choice for product
	def choice_select
	loop do
		loop do
			print "\n\t\tEnter product Id: "
	#get product id from user
			@choice=gets.to_i
	#check condition for choice
			break if @choice>0 and @choice<@count+1
			puts "\n\n\t\tInvalid Id!!!...Enter Correct"
		end
			statement=@connection.prepare("select * from inline_products where p_id=? and card_no=?")
			statement.execute(@choice,@card_no)
			break if (recordset=statement.fetch).nil?
			puts "\n\n\t\tYou already purchased this product....!!!"
	end
	#call methods product details
		product_details(@choice)
	end
#to get quantity from user
	def product_details(choice)
	#fetch record from products for select user product
		statement1=@connection.prepare("select * from products where p_id=?")
		statement1.execute(choice)
		recordset1=statement1.fetch

		loop do
			print "\n\n\t\tEnter quantity: "
	#get quantity from user
			@quantity=gets.to_i
	#check quantity condition
		break if @quantity>0 and @quantity<recordset1[2]+1
			puts "\n\n\t\tInvalid Quantity!!!...Enter Correct"
		end

		rows=[]

		table=Terminal::Table.new
		table.headings=["Name","Price","Available Stock","Quantity"]

		rows<<[recordset1[1],recordset1[3],recordset1[2],@quantity]

		table.rows=rows

		puts "\n#{table}"
	#insert values into inline product that user selected product
		statement3=@connection.prepare("insert into inline_products values(?,?,?)")
		statement3.execute(@card_no,choice,@quantity)
		@connection.commit
	#call purchase_more_item method
		purchase_more_item
	end
# select more product by user 
	def purchase_more_item

		print "\n\n\tDo you want to purchase more product(y/n)?: " 
	#get option yes or no by user
		option=gets.chomp
		if option=="y" or option=="Y"
		#call choice_select method
			choice_select
		elsif option=="n" or option=="N"
		#call display_card method
				display_card
		else
			puts "\n\n\t\tInvalid Choice!!!...Try again"
		#call purchase_more_item method
			purchase_more_item
		end
	end
# to display products from shoping card
	def display_card	

		rows=[]

		table=Terminal::Table.new
		table.title="Your Shoping Card List"
		table.headings=["Product Id","Product Name","Product price","Product quantity","Total"]
#fetch recorde and multiplication of price and qauntity from inline_products and products
		statement5=@connection.prepare("select i.p_id,p.p_name,p.p_price,i.quantity,
			(p.p_price*i.quantity) from inline_products i,products p where i.card_no=? and p.p_id=i.p_id")
		statement5.execute(@card_no)
		
		while recordset3=statement5.fetch do

			rows<<[recordset3[0],recordset3[1],recordset3[2],recordset3[3],recordset3[4]]
		end

		table.rows=rows
		puts "\n#{table}"
#call add_edit_delete_confirm_card method
		add_edit_delete_confirm_card
	end
# user operation choice(add,edit,delete,cofirm)
	def add_edit_delete_confirm_card

		print "\n\n\tDo you want to(1.Add/2.Edit/3.Delete/4.Confirm)?: " 
		option=gets.to_i

		case (option)
			when 1
		#call menu method
				menu
			when 2
		#call edit method
				edit
			when 3
		#call delete method
				delete
			when 4
		#call confirm method
				confirm
			else
				puts "\n\n\t\tInvalid Choice!!!...Try again"
				add_edit_delete_confirm_card
		end
	end
# to edit qauntity in shoping card
	def edit

		loop do
			print "\n\t\tEnter product Id: "
			@choice_edit=gets.to_i
			break if @choice_edit>0 and @choice_edit<@count+1
			puts "\n\n\t\tInvalid Id!!!...Enter Correct"
		end
	#fetch recorde from products
		statement6=@connection.prepare("select * from products where p_id=?")
		statement6.execute(@choice_edit)
		recordset6=statement6.fetch

		loop do
			print "\n\n\t\tEnter New quantity: "
			@quantity_new=gets.to_i
		break if @quantity_new>0 and @quantity_new<recordset6[2]+1
			puts "\n\n\t\tInvalid Quantity!!!...Enter Correct"
		end

		puts "\n\n\t\tRecorde successfully updated...."

		rows=[]

		table=Terminal::Table.new
		table.headings=["Name","Price","Available Stock","New Quantity"]

		rows<<[recordset6[1],recordset6[3],recordset6[2],@quantity_new]

		table.rows=rows

		puts "\n#{table}"
#insert new quantity in shoping card
		statement7=@connection.prepare("update inline_products set quantity=? where p_id=? and card_no=?")
		statement7.execute(@quantity_new,@choice_edit,@card_no)
		@connection.commit
#call method edit_more
		edit_more

	end
#user want to edit more product 
	def edit_more

		print "\n\n\t\tDo you want to edit more(y/n)?: " 
		option=gets.chomp

		if option=="y" or option=="Y"
		#call edit method
				edit
		elsif option=="n" or option=="N"
		#call dispaly_card method
				display_card
		else
			puts "\n\n\t\tInvalid Choice!!!...Try again"
			edit_more
		end
	end
#to delete product from shoping card by user
	def delete

		loop do
			print "\n\t\tEnter product Id: "
			@choice_delete=gets.to_i
			break if @choice_delete>0 and @choice_delete<@count+1
			puts "\n\n\t\tInvalid Id!!!...Enter Correct"
		end

		print "\n\n\tAre you Sure want to delete this item(y/n)?: " 
		option=gets.chomp

		if option=="y" or option=="Y"
	#delete product from shoping card
				statement7=@connection.prepare("delete from inline_products where p_id=? and card_no=?")
				statement7.execute(@choice_delete,@card_no)
				puts "\n\n\t\tRecorde successfully deleted...."
		#call delete-more method
				delete_more
		elsif option=="n" or option=="N"
				delete_more
		else
			puts "\n\n\t\tInvalid Choice!!!...Try again"
		#call delete method
			delete
		end
		
	end
#to delete more products in shoping card
	def delete_more

		print "\n\n\t\tDo you want to delete more(y/n)?: " 
		option=gets.chomp

		if option=="y" or option=="Y"
		#call delete method
				delete
		elsif option=="n" or option=="N"
		#call dispaly_card method
				display_card
		else
			puts "\n\n\t\tInvalid Choice!!!...Try again"
		#call delete_more method
			delete_more
		end
	end
#to confirm products by user
	def confirm

		print "\n\n\tAre you Sure want to purchase this product(y/n)?: " 
		
		option=gets.chomp

		if option=="y" or option=="Y"
		
		loop do
			print "\n\n\t\tEnter Your Name: "
	#get user name
			@name=gets.chomp
	#check validation for name
		break if @name=~ /^[A-Z a-z]+$/ and @name.length>2 and @name.length<31
			puts "\n\n\t\tInvalid Name!!!...Enter Correct"
		end

		loop do
			print "\n\n\t\tEnter Your Address: "
	#get user address
			@address=gets.chomp
	#check validation for address
		break if@address.length>10 and @address.length<51
			puts "\n\n\t\tInvalid Address!!!...Enter full Correct address(minimum 10 character)"
		end
		
		loop do
			print "\n\n\t\tEnter Your Mobile No.: "
	#get mobile number
			@mobile=gets.chomp
	#check validation for mobile
		break if @mobile=~ /\d{10}/ and @mobile.length<11
			puts "\n\n\t\tInvalid Mobile No!!!...Enter Correct"
		end
	#insert values into users 
			statement8=@connection.prepare("insert into users values(?,?,?,?)")
			statement8.execute(@user_id,@name,@address,@mobile)
			@connection.commit
	#call order method
			order
			
		elsif option=="n" or option=="N"
	#call delete_entry method
				delete_entry
				exit -1
		else
			puts "\n\n\t\tInvalid Choice!!!...Try again"
	#call confirm method
			confirm
		end

	end
#to delete card no entry if user not buy product
	def delete_entry
		#delete product from cards
			statement=@connection.prepare("delete from cards where card_no=?")
			statement.execute(@card_no)
		#delete product from inline_products
			statement1=@connection.prepare("delete from inline_products where card_no=?")
			statement1.execute(@card_no)
	end
#to generate order for user
	def order
	#generate order id for user
		statement9=@connection.query("select order_id from order_buys ORDER BY order_id DESC LIMIT 1")
		recordset9=statement9.fetch_row
	#check record set is null
		if recordset9.nil?
		# if null assign default value
			order_id=1010101
		else
		# if not assign next value
			order_id=recordset9[0].next
		end
	#insert values and total amount into order table
		statement10=@connection.prepare("insert into order_buys values(?,?,(select sum(p.p_price*i.quantity) 
			from inline_products i,products p where i.card_no=? and p.p_id=i.p_id))")
		statement10.execute(@card_no,order_id,@card_no)
		@connection.commit
	#fetch total amount from order table
		statement11=@connection.prepare("select total from order_buys where order_id=?")
		statement11.execute(order_id)
		recordset11=statement11.fetch

		rows=[]

		table=Terminal::Table.new

		rows<< ["Your total amount in Rs.: #{recordset11[0]}"]
	#to generate new line in table 
		rows<<:separator
		rows<< ["Please.....Pay your amount...!!!"]

		table.rows=rows
		puts "\n#{table}"
	#call stock_change method
		stock_change

	end
#to change stock from products table when user buy products
	def stock_change

		print "\n\n\t\tAre You Confirm(y/n)"
		option=gets.chomp

		if option=="y" or option=="Y"
	#fetch product id from inline products
			statement12=@connection.prepare("select p_id from inline_products where card_no=?")
			statement12.execute(@card_no)

			while recordset12=statement12.fetch do
		#fetch quantity from shoping card and update stock in products 
				statement13=@connection.prepare("update products set p_stock=p_stock-(select quantity from 
					inline_products where p_id=? and card_no=?) where p_id=?")			
				statement13.execute(recordset12[0],@card_no,recordset12[0])
				
			end
		#call print_bill method
			print_bill

		elsif option=="n" or option=="N"
		#call delete_entry method
			delete_entry
		#delete user details if user not buy anything
			statement=@connection.prepare("delete from users where user_id=?")
			statement.execute(@user_id)

			exit -1

		else
			puts "\n\n\t\tInvalid Choice!!!...Try again"
		#call stock_chnage method
			stock_change
		end
	end
#to print bill of users
	def print_bill
	#fetch user details from user and shoping cards
		statement14=@connection.prepare("select u.user_name,u.user_add,u.user_mobile 
			from users u,cards c where u.user_id=c.user_id and c.card_no=?")
		statement14.execute(@card_no)
		recordset14=statement14.fetch
	#fetch product details and product total from inline product and product	
		statement15=@connection.prepare("select p.p_name,p.p_price,i.quantity,
			(p.p_price*i.quantity) from inline_products i,products p where i.card_no=? and p.p_id=i.p_id")
		statement15.execute(@card_no)
	#fetch order id and total from order table
		statement16=@connection.prepare("select order_id,total from order_buys where card_no=?")
		statement16.execute(@card_no)
		recordset16=statement16.fetch
	#use time class to print date
		t=Time.now
	#declare rows array
		rows=[]
	#use terminal table to generate tabel
		table=Terminal::Table.new
		rows<<["Inorbit Mall","","",""]
		rows<<["Bill Reciept","","",""]
		rows<<[""]
		rows<< ["Order No.: #{recordset16[0]}","","","Date:- #{t.day}/#{t.month}/#{t.year}"]
		rows<<[""]
		rows<< ["Name: #{recordset14[0]}"]
		rows<< ["Address: #{recordset14[1]}"]
		rows<< ["Mobile No: #{recordset14[2]}"]
		rows<<[""]
		rows<< ["Product Name","Product price","Product quantity","Price total"]
		rows<<[""]

		while recordset15=statement15.fetch do

			rows<<[recordset15[0],recordset15[1],recordset15[2],recordset15[3]]
		end
		rows<<[""]
		rows<< ["","","","Total: #{recordset16[1]}"]
		
		table.rows=rows
		puts "\n#{table}"
	#use prawn to generate pdf document file with name of order no
		Prawn::Document.generate("#{recordset16[0]}.pdf") do 
	#table is method to insert table in pdf and
	#rows is array that declared and already we used in terminal table
	#here to insert some data in table formate we want to write lengthy code
	#but using rows array that we are already implemented in terminal
	#we don't want to write new code here
	#to optimize code access that rows array
		table rows
		end

		exit -1
	end
end

Mall.new
