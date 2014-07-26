require 'mysql'
class Shop

	begin
		@con=Mysql.connect('localhost','root','root','MyDB')
		puts "\n\n\n---------------BK Shopping Cart--------------------\n\n"
		puts "\n****************Select Category*****************\n"
		puts "\n\t1. Books \t2. Computers\t 3. Mobiles\t 4.Home & Kitchen"
		print "\n Please choose your category :"
		category=gets.to_i
		case (category)
		when 1
			stmt1=@con.query("select id,name,price from books")
			while row=stmt1.fetch_row do
				@id=row[0] 
				@name=row[1]
				@price=row[2]

				print "\nProduct ID #{@id}. Title: #{@name} Rs: #{@price}"
			end
			print "\n\nDo you want to purchace [Y/N]"
			temp=gets.chomp
			if temp=='y'
				print "\nEnter quantity :"
				qua=gets.to_i
				book_price=price*qua
				 stmt2=@con.prepare("insert into cart values(?,?,?)")
				 stmt2.execute(id,book_price,qua)
				else
					
			end


		when 2
			
	
		#Case end			
		end
		
	#begin end	
end
#class end
end