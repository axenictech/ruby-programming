require "mysql"
require "terminal-table"

class BigBazaar

	def display_existing_list
		con=Mysql.connect("localhost","root","root","ShopDemo") #Connection established
		com=con.query("select * from ItemList")
		rows=[]
		table=Terminal::Table.new

		while row=com.fetch_row do
			rows<<row
		end
		table.rows=rows
		puts table
	end

	def add_to_cart
		con=Mysql.connect("localhost","root","root","ShopDemo") #Connection established

		puts "Please enter Item ID :"
		item_id=gets.chomp

		puts "Please enter quantity for that item :"
		qty=gets.to_i

		item_bill=0
		com=con.prepare("select Item_Name, Item_Price from ItemList where Item_ID = ?")
		com.execute(item_id)

		rs = com.fetch
		price=rs[1].to_i
		item_bill= price * qty

		item_nm=rs[0]

		com=con.prepare("insert into InvoiceBill(Item_Name, Item_Price, Item_Qty, Item_Bill) 
			values(?, ?, ?, ?)")
		com.execute(item_nm, price, qty, item_bill)

		con.commit
		puts "Item added to the cart...!!!"
				
	end

	def update_my_cart
	end

	def display_final_bill
		con=Mysql.connect("localhost","root","root","ShopDemo") #Connection established
		com=con.query("select * from InvoiceBill")
		rows=[]
		table=Terminal::Table.new

		while row=com.fetch_row do
			rows<<row
		end
		table.rows=rows
		puts table
	end

	def update_existing_list
		con=Mysql.connect("localhost","root","root","ShopDemo") #Connection established

		puts "Please enter Item Name :"
		item_nm=gets.chomp

		puts "Please enter Price for that item :"
		price=gets.to_i

		com=con.prepare("insert into ItemList(Item_Name, Item_Price) values(?, ?)")
		com.execute(item_nm, price)

		con.commit
		puts "Current Stock Updated Successfully!!!"

	end
end

ans=BigBazaar.new

puts "Big Bazaar"
puts "1. Show Item List"
puts "2. Add to Cart"
puts "3. Update My Cart"
puts "4. Delete from My Cart"
puts "5. Show Final Bill"
puts "6. Update current stock"
puts "7. Exit"
puts "Enter your choice :"
ch=gets.to_i
	
case ch

when 1
	ans.display_existing_list #display current inventory

when 2
	ans.add_to_cart	#add to cart

when 3
	ans.display_final_bill #show final bill first for update
	ans.update_my_cart #update my cart

when 4
	#delete from my cart

when 5
	ans.display_final_bill #show final bill

 when 6
	ans.update_existing_list #update current stock

 when 7
	puts "7"

else
	puts"You Enterd wrong choice..."
end