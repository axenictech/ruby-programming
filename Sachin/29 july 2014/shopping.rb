require "mysql"

require 'terminal-table'
class Shoppingcart

	def initialize
		begin

			#database connection....
			@con=Mysql.connect("localhost","root","root")

			#create database and and all tables...
    		@con.query("create database if not exists\ Shopping")
			@con.query("use Shopping")

			@con.query("create table if not exists\ products(p_id int primary key,p_name varchar(20),quantity int,amount int)")
			@con.query("create table if not exists\ cart(c_id int primary key,p_id int)")
			@con.query("create table if not exists\ addcart(c_id int, foreign key(c_id) references cart(c_id),p_id int, foreign key(p_id) references products(p_id),quantity_i int)")
			@con.query("create table if not exists\ confirm(o_id int primary key,c_id int,foreign key(c_id) references cart(c_id),total int)")

			stmtt=@con.query("select * from products")
        	stmttt=@con.query("select * from cart")
        	stmtttt=@con.query("select * from confirm")

			if (record1=stmtt.fetch_row).nil?
				@con.query("insert into products values(1,'shirt',200,200),
														(2,'jeans',200,1200),
														(3,'trouser',200,1000),
														(4,'shoes',200,1500),
														(5,'T-shirt',200,800)")
			end

			#print the default value...
			if (record3=stmttt.fetch_row).nil?
              	@con.query("insert into cart values(1,1)")
        	end

        	if (record4=stmtttt.fetch_row).nil?
              	@con.query("insert into confirm(o_id) values(1)")
        	end
        	product
		    
		    #throw the exception if occure and print by e
			rescue Mysql::Error=>e

			puts "Error in Connection-.....#{e}"

			ensure
	
			@con.close if @con
		end
	end

	def product

		puts "\n\n\t\t\t\t********Shopping Mall**********\n\n"

		#fetch the data  from products table
        stmt1=@con.query("select * from products")

        #print the output in table format in console
        table=Terminal::Table.new
        rows=[]
        while row=stmt1.fetch_row do
			table.headings=['Id','Name','Quantity','Amount']
			rows<<[row[0],row[1],row[2],row[3]]
		end
		table.rows=rows
		puts "#{table}"
		prod_cart
	end

	def prod_cart

		begin
				
			statmt1=@con.prepare("select c_id from cart")
			statmt1.execute

            while rs1=statmt1.fetch do
				id1=rs1[0]				
			end
			#increament the id by 1
			@c_id=id1.next

        	stmt1=@con.prepare("insert into cart values(?,?)")
			stmt1.execute(@c_id,@id)
     

        	select
	
			@con.commit
			rescue Mysql::Error=>e
			puts "Error in Connection-.....#{e}"
			ensure
			@con.close if @con
		end
	end

	def select 
        
        #select item in which you want selected..
        print "\n\n\t\tSelect Product Id : "
        pid=gets.chomp
        if pid=~/^[0-9]+$/
		@p_id=pid
        #quantity
        print "\n\n\t\thow many quantity : "
        @quantity_pc=gets.to_i

        #add the items which you have to selected
        stmt6=@con.prepare("insert into addcart values(?,?,?)")
        stmt6.execute(@c_id,@p_id,@quantity_pc)
    	else
         puts "Enter proper id !!!"
        select 

        end
       repeat
	end

    def repeat

		print "\n\t\tDo you want more product(y/n)? : " 
				
		ch=gets.chomp
		if (ch=~/^[y]+$/) then
			select
			elsif ch=~/^[n]+$/
			puts "\n\t\tThank You!!!"


			#calulate amount of perticular product which had been selected(quantity*amount)
			stmt15=@con.prepare("select p.p_name,i.quantity_i, p.amount, (i.quantity_i * p.amount) from addcart i,products p where i.c_id=? and  p.p_id=i.p_id")
         	stmt15.execute(@c_id)
       		#addition of all amount which been selected 
         	stmt16=@con.prepare("select sum(i.quantity_i * p.amount) from addcart i,products p where i.c_id=? and  p.p_id=i.p_id")
         	stmt16.execute(@c_id)

         	#fetch the record from table and calculate all total of the price
         	record5=stmt16.fetch
         	@add=record5[0]
         
			order 
		 	else
			puts "\n\t\tInvalid Choice!!!...Try again"
			repeat
		end	
	end
	#call the method order if you want a bill and confirmation
	def order
           
        print "\n \t\tYour total product price is :#{@add}\n"
	    print "\n \t\tDo you want to confirm a bill(y/n)?: " 
		ch1=gets.chomp
		if (ch1=~/^[y]+$/) then
          	
			payment
			elsif (ch1=~/^[n]+$/)
			puts "\n\t\tThank You!!!"
			else
			puts "\n\n\t\tInvalid Choice!!!...Try again"
		   	exit -1
	    end 
	end

	#printing your bill....
	def payment

		puts "\n*******************************Payment*********************"
         
        
        stm=@con.prepare("select p.p_name,i.quantity_i, p.amount, (i.quantity_i * p.amount) from addcart i,products p where i.c_id=? and  p.p_id=i.p_id")
        stm.execute(@c_id)
       
        st=@con.prepare("select sum(i.quantity_i * p.amount) from addcart i,products p where i.c_id=? and  p.p_id=i.p_id")
        st.execute(@c_id)
        row6=st.fetch

        @total=row6[0]

        puts "\n\n"
        #print the data in the proper table format 
        table1 = Terminal::Table.new
        rows=[]
        rows<<:separator
        rows<<['','','','']
        rows<<['Product Name','Rate','Quantity','Amount']
		rows<<:separator
		while row=stm.fetch do
				   
		   rows<<[row[0],row[2],row[1],row[3]]
		end
		rows<<:separator
	    rows<<['','','Total',row6[0]]
        table1.rows=rows
	    puts "#{table1}"
       	
       	puts "\n\n\t\t!!!!!!!!!!!!!Thnak you...Visit again !!!!!!!!!!!!!!!!\n\n"
        statmt2=@con.prepare("select o_id from confirm")
        statmt2.execute

        while rs2=statmt2.fetch do
	        id2=rs2[0]				
        end
	               
		@o_id=id2.next

        stmt11=@con.prepare("insert into confirm values(?,?,?)")
        stmt11.execute(@o_id,@c_id, @total)
	end
end
Shoppingcart.new