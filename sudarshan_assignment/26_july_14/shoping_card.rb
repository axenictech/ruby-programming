#to do program under working ?????

# Where is  the comments??

require"mysql"

class Mall

	def initialize
	
		begin
			#change the password 
			@connection=Mysql.connect("localhost","root","root")

			
			@connection.query("create database if not exists\ shop")
			
			@connection.query("use shop")

			@connection.query("create table if not exists\ product
				(p_id int primary key,p_name varchar(20),p_stock int, p_price int)")

			@connection.query("create table if not exists\ card
				(card_no int,user_id int, primary key (card_no,user_id))")

			@connection.query("create table if not exists\ inline_product
				(card_no int,p_id int,quantity int, foreign key(p_id) references product(p_id))")

            # user table not able to create 
			@connection.query("create table if not exists\ user
				(user_id int,user_name varchar(50),user_add varchar(50),
					user_mobile int,foreign key(user_id) references card(user_id))")
			

			@connection.query("create table if not exists\ order_buy
				(card_no int,order_id int primary key,total int)")

			puts "\n\n\t\t\t\tWelcome To Inorbit Mall"
			# why this below methods are commented ??
			#------------------ Program is not working ----------------------	
			# auto_increment
			# menu

            # 	Welcome To Inorbit Mall only this msg displays and prog over 

		rescue Mysql::Error=>e

			puts "Error in Connection-.....#{e}"

		ensure
			@connection.close if @connection

		end

	end

	def menu

		statement=@connection.query("select p_id,p_name,p_price from product")
			
			puts"\n\n"
			@count=0
		while recordset=statement.fetch_row do

			print "\t\t\t\t\t#{recordset[0]}.#{recordset[1]}\t\t#{recordset[2]}"
			puts
			@count+=1
		end

		choice_select
	end

	def choice_select

			print "\n\t\t\t\tEnter your choice: "
			choice=gets.to_i

		if choice>0 and choice<@count+1
				
			product_details(choice)

		else
			puts "\n\n\t\t\t\tInvalid Choice!!!...Enter Correct"
			choice_select
		end

	end

	def product_details(choice)

		statement1=@connection.prepare("select * from product where p_id=?")
		statement1.execute(choice)
		recordset1=statement1.fetch

		print "\n\n\t\t\t\tProduct Name: #{recordset1[1]}"
		print "\n\n\t\t\tAvailable Stock: #{recordset1[2]}"
		print "\tPrice in Rs: #{recordset1[3]}"
		
		print "\n\n\t\t\t\tEnter quantity: "
		quantity=gets.to_i

		statement3=@connection.prepare("insert into inline_product values(?,?,?)")
		statement3.execute(@card_no,choice,quantity)
		@connection.commit

		purchase_more_item
	end

	def purchase_more_item

		print "\n\n\t\t\tDo you want to purchase more product(y/n)?: " 
		option=gets.chomp
		if option=="y" or option=="Y"
			choice_select
		elsif option=="n" or option=="N"
				display_card
		else
			puts "\n\n\t\t\t\tInvalid Choice!!!...Try again"
			purchase_more_item
		end
	end

	def auto_increment

		statement2=@connection.query("select card_no,user_id from card ORDER BY card_no DESC LIMIT 1")
		recordset2=statement2.fetch_row

		if recordset2.nil?
			@card_no=101
			@user_id=1111
		else
			@card_no=recordset2[0].next
			@user_id=recordset2[1].next
		end
		
		statement4=@connection.prepare("insert into card values(?,?)")
		statement4.execute(@card_no,@user_id)
		@connection.commit
	end

	def display_card	

		puts "\n\n\t\t\t\tYour Shoping Card List\n\n"

		statement5=@connection.prepare("select i.p_id,p.p_name,p.p_price,i.quantity,
			(p.p_price*i.quantity) from inline_product i,product p where i.card_no=? and p.p_id=i.p_id")
		statement5.execute(@card_no)
		
		print "\t\t\tProduct Id\tProduct Name\t\tProduct price\tProduct quantity\tPrice total\n"
		while recordset3=statement5.fetch do

			print "\t\t\t#{recordset3[0]}\t#{recordset3[1]}\t\t#{recordset3[2]}\t#{recordset3[3]}\t#{recordset3[4]}\n"
		end

		add_edit_delete_confirm_card
	end

	def add_edit_delete_confirm_card

		print "\n\n\t\t\tDo you want to(1.Add/2.Edit/3.Delete/4.Confirm)?: " 
		option=gets.to_i

		case (option)
			when 1
				menu
			when 2
				edit
			when 3
				delete
			when 4
				confirm
			else
				puts "\n\n\t\t\t\tInvalid Choice!!!...Try again"
				add_edit_delete_confirm_card
		end
	end

	def edit

		print "\n\n\t\t\t\tEnter product id: "
		choice=gets.to_i

		statement6=@connection.prepare("select * from product where p_id=?")
		statement6.execute(choice)
		recordset6=statement6.fetch

		print "\n\n\t\t\t\tProduct Name: #{recordset6[1]}"
		print "\n\n\t\t\tAvailable Stock: #{recordset6[2]}"
		print "\tPrice in Rs: #{recordset6[3]}"
		
		print "\n\n\t\t\t\tEnter New quantity: "
		quantity=gets.to_i

		statement7=@connection.prepare("update inline_product set quantity=? where p_id=? and card_no=?")
		statement7.execute(quantity,choice,@card_no)
		@connection.commit

		puts "\n\n\t\t\t\tRecorde successfully changed...."
		edit_more

	end

	def edit_more

		print "\n\n\t\t\tDo you want to edit more(y/n)?: " 
		option=gets.chomp

		if option=="y" or option=="Y"
				edit
		elsif option=="n" or option=="N"
				display_card
		else
			puts "\n\n\t\t\t\tInvalid Choice!!!...Try again"
			edit_more
		end
	end

	def delete

		print "\n\n\t\t\t\tEnter product id: "
		choice=gets.to_i

		print "\n\n\t\t\tAre you Sure want to delete this item(y/n)?: " 
		option=gets.chomp

		if option=="y" or option=="Y"
				statement7=@connection.prepare("delete from inline_product where p_id=? and card_no=?")
				statement7.execute(choice,@card_no)
				puts "\n\n\t\t\t\tRecorde successfully deleted...."
				delete_more
		elsif option=="n" or option=="N"
				delete_more
		else
			puts "\n\n\t\t\t\tInvalid Choice!!!...Try again"
			delete
		end
		
	end

	def delete_more

		print "\n\n\t\t\tDo you want to delete more(y/n)?: " 
		option=gets.chomp

		if option=="y" or option=="Y"
				delete
		elsif option=="n" or option=="N"
				display_card
		else
			puts "\n\n\t\t\t\tInvalid Choice!!!...Try again"
			delete_more
		end
	end

	def confirm

		print "\n\n\t\t\tAre you Sure want to purchase this product(y/n)?: " 
		
		option=gets.chomp

		if option=="y" or option=="Y"
			
			print "\n\n\t\t\t\tEnter Your Name: "
			name=gets.chomp

			print "\n\n\t\t\t\tEnter Your Address: "
			address=gets.chomp

			print "\n\n\t\t\t\tEnter Your Mobile No.: "
			mobile=gets.to_i

			statement8=@connection.prepare("insert into user values(?,?,?,?)")
			statement8.execute(@user_id,name,address,mobile)
			@connection.commit

			order
			
		elsif option=="n" or option=="N"
				
				delete_entry
				exit -1
		else
			puts "\n\n\t\t\t\tInvalid Choice!!!...Try again"
			confirm
		end

	end

	def delete_entry

			statement=@connection.prepare("delete from card where card_no=?")
			statement.execute(@card_no)
			statement1=@connection.prepare("delete from inline_product where card_no=?")
			statement1.execute(@card_no)
	end

	def order

		statement9=@connection.query("select order_id from order_buy ORDER BY order_id DESC LIMIT 1")
		recordset9=statement9.fetch_row
		
		if recordset9.nil?
			order_id=1010101
		else
			order_id=recordset9[0].next
		end

		statement10=@connection.prepare("insert into order_buy values(?,?,(select sum(p.p_price*i.quantity) 
			from inline_product i,product p where i.card_no=? and p.p_id=i.p_id))")
		statement10.execute(order_id,@card_no,@card_no)
		@connection.commit
		
		statement11=@connection.prepare("select total from order_buy where order_id=?")
		statement11.execute(order_id)
		recordset11=statement11.fetch

		print "\n\n\n\t\t\t\tYour total amount in Rs.: #{recordset11[0]}"
		puts "\n\n\t\t\t\tPlease.....Pay your amount...!!!"

		stock_change

	end

	def stock_change

		print "\n\n\t\t\tAre You Confirm(y/n)"
		option=gets.chomp

		if option=="y" or option=="Y"
				
			statement12=@connection.prepare("select p_id from inline_product where card_no=?")
			statement12.execute(@card_no)
			
			while recordset12=statement12.fetch do

				statement13=@connection.prepare("update product set p_stock=p_stock-(select quantity from 
					inline_product where p_id=? and card_no=?) where p_id=?")			
				statement13.execute(recordset12[0],@card_no,recordset12[0])
				
			end
			print_bill

		elsif option=="n" or option=="N"
				
			delete_entry

			statement=@connection.prepare("delete from user where user_id=?")
			statement.execute(@user_id)

			exit -1

		else
			puts "\n\n\t\t\t\tInvalid Choice!!!...Try again"
			stock_change
		end
	end

	def print_bill

		puts "\n\n\n\t\t\t\tInorbit Mall"
		puts "\t\t\t\tBill Reciept"

		statement14=@connection.prepare("select u.user_name,u.user_add,u.user_mobile 
			from user u,card c where u.user_id=c.user_id and c.card_no=?")
		statement14.execute(@card_no)
		recordset14=statement14.fetch

		statement15=@connection.prepare("select p.p_name,p.p_price,i.quantity,
			(p.p_price*i.quantity) from inline_product i,product p where i.card_no=? and p.p_id=i.p_id")
		statement15.execute(@card_no)

		statement16=@connection.prepare("select order_id,total from order_buy where card_no=?")
		statement16.execute(@card_no)
		recordset16=statement16.fetch

		t=Time.now

		print "\n\t\tOrder No.: #{recordset16[0]}\t\t\t\tDate:- #{t.day}/#{t.month}/#{t.year}"

		print "\n\t\tName: #{recordset14[0]}"
		print "\n\t\tAddress: #{recordset14[1]}"
		print "\n\t\tMobile No: #{recordset14[2]}"
		
		print "\n\n\t\tProduct Name\t\tProduct price\tProduct quantity\tPrice total\n"
		
		while recordset15=statement15.fetch do

			print "\t\t\t#{recordset15[0]}\t#{recordset15[1]}\t\t#{recordset15[2]}\t#{recordset15[3]}\n"
		end

		print "\t\t\t\t\t\t\tTotal: #{recordset16[1]}\n\n\n\n"

		exit -1
	end
end

Mall.new