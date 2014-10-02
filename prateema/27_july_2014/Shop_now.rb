#Where is the comments ??
require 'mysql'
require "terminal-table"
class Shop
	
	def initialize	

	 begin
        
        @conn=Mysql.connect("localhost","root","mysql")
        @conn.query("create database if not exists\ prateema")
        @conn.query("use prateema")
        @conn.query("create table if not exists\ item_details
				(item_id int primary key,item_name varchar(20),item_qt int, item_cost int)")

    	insert_tab=@conn.query("select * from item_details")
			if (select_item=insert_tab.fetch_row).nil?
					@conn.query("insert into item_details values 
										(1001,'tops',20,900),
										(2002,'kurti',20,1000),
										(3008,'bags',20,400),
										(9172,'jeans',20,1000),
										(0272,'shorts',20,300),
										(8725,'shoes',20,300),
										(8276,'rings',20,800),
										(8922,'sandles',20,1000),
										(9927,'stelltoes',20,400),
										(1088,'formals',20,200)")
			end

			@conn.query("create table if not exists\ q_table(temp_qt int,temp_name varchar(20))")
			@conn.query("create table if not exists\ cart_table(prod_id int,cart_name varchar(20),cart_qt int,cart_cost int)")

		  display_details

      rescue Mysql::Error=>e 
        puts "Connection error.....#{e}"

      ensure
        @conn.close if @conn
     end

    end
    


    def display_details
    	display=@conn.query("select * from item_details")
    	  print "\n\t\tPRODUCT ID\t\tNAME\t\tQUANTITY\t\tCOST/per "
          while row=display.fetch_row  do 
          print "\n\t\t#{row[0]} \t\t\t#{row[1]}\t\t#{row[2]}\t\t#{row[3]}"
          puts "\n"
          end
        select_item
    end

    def select_item
    	
    	puts "\t\t SELECT PRODUCT NAME"
    	@s_prd=gets.chomp
    	puts "\t\t QUANTITY OF PRODUCT"
    	@s_qt=gets
    	
    	quant_tab=@conn.prepare("insert into q_table(temp_qt,temp_name) values(?,?)")
    	quant_tab.execute(@s_qt,@s_prd)
    	@conn.commit

    	# insert into cart_table

    	cart_me=@conn.prepare("INSERT INTO cart_table(prod_id,cart_name,cart_qt,cart_cost)SELECT item_id,item_name,temp_qt,item_cost FROM item_details,q_table WHERE item_name=? and temp_name=?")
    	cart_me.execute(@s_prd,@s_prd)
    	@conn.commit

    	# calculating the cost
    	cal_item=@conn.prepare("select (cart_qt*cart_cost) from cart_table where cart_name=?")
    	cal_item.execute(@s_prd)
    	prod_select=cal_item.fetch
    	@amout=prod_select * @s_qt
    	
    	
    	#updating the item_details
		insert_cart=@conn.prepare("update cart_table set cart_cost=? where cart_name=?")
		insert_cart.execute(@amout  ,@s_prd)	
    	
        puts "BUY another product"
        @choice=gets
        if (@choice=~/^[y]+$/)
        	select_item
    	
    	else
    		# puts "adafa"
    		cart_data=@conn.query("select * from cart_table")
    		 while row=cart_data.fetch_row  do 
    		 	print "\tID\tNAME\tTOTAL "
        	 	print " \n\t#{row[0]}\t#{row[1]}\t#{row[3]}"
          		puts "\n"
    		 end
    	
    		generate_bill
    	end
    	
    	
    end

    def generate_bill
    	gen_bil=@conn.query("select sum(cart_cost),cart_cost from cart_table")
    	grand_total=gen_bil.fetch_row
    	gt=grand_total[0]
    	 @cost=grand_total[1]

    	print "\t\tThe total bill is #{gt}"
    	
    	puts "\tdo u want to go further"
    	@gen=gets
    	if(@gen=~/^[y]+$/)
    		accept_name
    	else
    		puts "under construction"
    	end


    end

    # accepting the name
    def accept_name

   		puts "Enter name:"        
    	  @name=gets
  
    	if (@name=~/^[a-z]+$/) then 
    		  puts "\t\t\tAccepted"
    		  accept_address
    	else
      	puts "\t\t\tThe #{@name} entered is improper PLEASE ENTER A VALID NAME"
      	accept_name
    	end

    end

    # accepting address
    def accept_address

      puts "Enter Address:"        
      @address=gets
  		if (@address=~/^[a-z]+$/) then 
      	puts "\t\t\tAccepted"
      	accept_postal
    	else
      	puts "\t\t\tThe #{@address} entered is improper PLEASE ENTER A VALID ADDRESS"
      	accept_address
    	end

    end

	    #acceptong the postal code 
    def accept_postal

    	 puts "Enter postal code"
    	 @postal=gets.chomp

    	 if(@postal.length!=6 and @postal!~/^[a-z]+$/)
    	 	puts " 6 digits postal code"
    	 	accept_postal
    	 else
    	 	puts "\t\t\tAccepted"
    	 	update_table
    	 end		

    end

    def update_table
    	cnt=@conn.query("select temp_name from q_table")
    	
    	while cnt_tab=cnt.fetch_row do
    	update_me=@conn.prepare("update item_details set item_qt=item_qt-(select temp_qt from q_table where temp_name=? )where item_name=?")
    	update_me.execute(cnt_tab[0],cnt_tab[0])
    	end
    	puts 

    	print_bill

    end

    def print_bill

    	print "\n \n=========================================================================="
    	print "\n\t\tCUSTOMER :#{@name}\t\tADDRESS :#{@address}\t\tPOSTAL CODE :#{@postal} "
    	print "\n\t\tTOTAL AMOUNT :#{@amout} RS/- "	
	    print "\n\n ==========================================================================\n"	
    end

end

Shop.new