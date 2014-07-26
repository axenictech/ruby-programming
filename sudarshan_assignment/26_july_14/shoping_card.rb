#to do program under working

require"mysql"

class Mall

	def initialize
	
		begin

			@connection=Mysql.connect("localhost","root","mysql","mall")
			
			puts "\n\n\t\t\t\tWelcome To Inorbit Mall\n\n"
			
			menu
			auto_increment
			choice_select

		rescue Mysql::Error=>e

			puts "Error in Connection-.....#{e}"

		ensure
			@connection.close if @connection

		end

	end

	def menu

		statement=@connection.query("select p_id,p_name from product")
		
		while recordset=statement.fetch_row do

			print "\t\t\t\t\t#{recordset[0]}.#{recordset[1]}"
			puts
		end
	end

	def choice_select

			print "\n\t\t\t\tEnter your choice: "
			choice=gets.to_i
			product_details(choice)
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

		print "\n\n\t\tDo you want to continue purchase more product(y/n)?: " 
		option=gets.chomp
		if option=="y" or option=="Y"
			choice_select
		elsif option=="n" or option=="N"
			
		else
			puts "\n\n\t\t\t\tInvalid Choice!!!...Try again"
			purchase_more_item
		end
	end

	def auto_increment

		statement2=@connection.query("select card_no,user_id from card ORDER BY card_no  DESC LIMIT 1")
		recordset2=statement2.fetch_row
		@card_no=recordset2[0].next
		@user_id=recordset2[1].next

		statement4=@connection.prepare("insert into card values()")
	end
end

Mall.new