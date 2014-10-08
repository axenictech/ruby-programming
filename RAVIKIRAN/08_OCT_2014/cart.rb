require "pg"

			begin
				print "ENTER THE ITEM NAME :"
				i_name=gets
				print "ENTER THE ITEM PRICE :"
				i_price=gets.to_f
				print "ENTER THE ITEM QUANTITY :"
				i_quantity=gets.to_i

				i_amt=i_quantity*i_price
				puts i_name
				puts i_price
				puts i_quantity
				puts i_amt
				connection=PGconn.connect("localhost",5432,'','',"cart","root","root")
				puts "OK"
				rs=connection.prepare("insert into seller_stock(item_name,item_price,item_remain,item_amt) values(?,?,?,?)")
				rs.execute("#{i_name}","#{i_price}","#{i_quantity}","#{i_amt}")
				puts "RECORD ADDED SUCCESSFULLY"
				
				connection.commit
			rescue Exception => e
	
				puts "Error in connection.....#{e}"
			end