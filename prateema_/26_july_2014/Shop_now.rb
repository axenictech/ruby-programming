
require 'mysql'

class Shop
	
	def initialize	

	 begin
        
        @conn=Mysql.connect("localhost","root","root","prateema")
        @conn.query("CREATE TABLE IF NOT EXISTS person_det(id int primary key AUTO_INCREMENT,name varchar(20),address varchar(20),age int,password varchar(20),email varchar(20))")
        display_details
    
      rescue Mysql::Error=>e 
        puts "Connection error"

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
    	puts "enter product name"
    	@pname=gets

    	if(@pname=~/^[a-zA-Z]+$/)
    		select_product=@conn.prepare("select item_name from item_details where item_name=?")
    		select_product.execute(@pname)
    		puts row=select_product.fetch

    		
           	if prod_avail.nil? 
           		puts "product out of stock"
           	else
           		cart_me
           	end
        else
        	puts " Is Name of product proper"   		

    	end	       
 
    end

   	def cart_me
   		puts "QUANTITY?:"
   		@quantiy=gets;

   		
   		@cart=@conn.prepare("select item_cost from item_details where item_name=?")
   		@cart.execute(@pname)
   		row=@cart.fetch_row
   		puts cost=row[0]
   		 

   		# @insert_temp=@conn.prepare("INSERT INTO ")
   		# @conn.commit
   		



	end


end

Shop.new