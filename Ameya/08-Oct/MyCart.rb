#Sopping cart application using Postgres

require "pg"
require "terminal-table"

class BigBazaar

	def display_available_stock
		begin
			con=PGconn.connect("localhost",5432,"","","ShopDB", "root","root") #Connection established
			com=con.query("select * from Available_Stock")
			rows=[]
			table=Terminal::Table.new

			while row=com.fetch_row do
				rows<<row
			end
			table.rows=rows
			puts table

		rescue Exception => e
			puts "Error in connection.....#{e}"
		end
	end

	def reg_new_customer
		begin
	
			con=PGconn.connect("localhost",5432,"","","ShopDB", "root","root")

			con.query("create table if does not exist\ Cust_Reg(Cust_ID int(5) SERIAL PRIMARY KEY, 
				Cust_Name varchar varchar(20), Cust_Address varchar(20), Bill_No int(5)")
			puts "Table Cust_Reg created"

		rescue Exception => e
			puts "Error in connection.....#{e}"
		end
	end #reg_new_customer end

end #class end

var_BigBazaar=BigBazaar.new

while true do

	puts "***** Welcome to Big Bazaar *****"
	puts "1. Show Item List"
	puts "2. Customer Registration"
	puts "3. Exit"
	puts "Enter your choice :"
	ch=gets.to_i
	
	case ch

	when 1
		var_BigBazaar.display_available_stock #available stock

	when 2
		var_BigBazaar.reg_new_customer #customer registration

	when 3
		puts "Exit"

	else
		puts"You Enterd wrong choice..."
	end
end