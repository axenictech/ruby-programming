#Where is the comments ??
require 'mysql'

class Shop
	
	def initialize	

	 begin
        
        #Database not able to create 
        #-------Program is not working ------
        @conn=Mysql.connect("localhost","root","root","prateema")
        @conn.query("CREATE TABLE IF NOT EXISTS person_det(id int primary key AUTO_INCREMENT,name varchar(20),address varchar(20),age int,password varchar(20),email varchar(20))")
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
    	puts "\t\t Quantity of the PRODUCT"
    	@s_qt=gets
    	
    	quant_tab=@conn.prepare("insert into q_table(temp_qt,temp_name) values(?,?)")
    	quant_tab.execute(@s_qt,@s_prd)
    	@conn.commit

    	# insert into cart_table
    	cart_me=@conn.prepare("INSERT INTO cart_table(cart_id,cart_name)SELECT item_id,item_name FROM item_details WHERE item_name=?")
    	cart_me.execute(@s_prd)
    	@conn.commit

    	cal_item=@conn.prepare("select item_cost from item_details where item_name=?")
    	cal_item.execute(@s_prd)
    	prod_select=cal_item.fetch
    	@amout=prod_select * @s_qt
    	# puts amout
    	

    	# select_p=@conn.prepare("select item_cost from item_details where item_name=?")
    	# select_p.execute(@s_prd)
    	# prod_select=select_p.fetch
    	
    	# cart_me1=@conn.prepare("insert into cart_table(item_cost,item_qt,item_total) values(?,?,?) where cart_") 
    	# cart_me1.execute()
    	#  @conn.commit

		insert_cart=@conn.prepare("update cart_table set cart_total=? where cart_name=?")
		insert_cart.execute(@amout,@s_prd)
		@conn.commit    	

    	# {printing a single value
    	# select_p=@conn.prepare("select item_cost from item_details where item_name=?")
    	# select_p.execute(@s_prd)
    	# prod_select=select_p.fetch
    	
        # puts "\t\t#{prod_select[0]}"
        # }

        puts "BUY another product"
        @choice=gets
        if (@choice=~/^[y]+$/)
        	select_item
    	
    	else
    		# puts "adafa"
    		cart_data=@conn.query("select * from cart_table")
    		 while row=cart_data.fetch_row  do 
    		 	print "\tID\tNAME\tTOTAL "
        	 	print " #{row[0]}"
          		puts " #{row[1]}"
         		puts " #{row[2]}"
          		puts "\n"
    		 end
    	
    		generate_bill
    	end
    	
    	
    end

    def generate_bill
    	gen_bil=@conn.query("select sum(cart_total) from cart_table")
    	grand_total=gen_bil.fetch_row
    	gt=grand_total[0]
    	 
    	print "\t\tThe total bill is #{gt}"
    	
    	puts "\tdo u want to go further"
    	@gen=gets
    	if(@gen=~/^[y]+$/)
    		accept_name
    	else
    		puts "under construction"
    	end


    end

    
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

    def accept_postal

    	 puts "Enter postal code"
    	 @postal=gets.chomp

    	 if(@postal.length!=6 and @postal!~/^[a-z]+$/)
    	 	puts "incorrect"
    	 	accept_postal
    	 else
    	 	puts "\t\t\tAccepted"
    	 	update_table
    	 end		

    end

    def update_table
    	@cnt=@conn.query("select count(*) from q_table")
    	puts @cnt
    	update_me=@conn.prepare("update item_details set item_qt=item_qt-(select temp_qt from q_table where temp_name=? )where item_name=?")
    	update_me.execute(@s_prd,@s_prd)
    	@conn.commit
    	print_bill
    	puts 

    end

    def print_bill
    	print "\n \n=========================================================================="
    	print "\n\t\t CUSTOMER :#{@name} \t ADDRESS :#{@address} \t POSTAL CODE :#{@postal} "
    	print "\n TOTAL AMOUNT :#{@amout}RS/- "	
	    print "\n\n =========================================================================="	
    end

end

Shop.new