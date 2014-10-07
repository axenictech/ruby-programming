require "mysql"
require "terminal-table"
class ShoppingCart
	def connect
		begin
		@con=Mysql.connect("localhost","root","root","Axenic")
		@con.query("create table if not exists \ ItemList (itemId int(10) primary key,itemName varchar(20),itemPrice int(50))")
		res=@con.query("select * from ItemList")
		
         if(row=res.fetch_row).nil?
		insert=@con.prepare("insert into ItemList(itemId,itemName,itemPrice)values (?,?,?)")
		insert.execute(1,"Pen",10)
		insert.execute(2,"Notebook",20)
		insert.execute(3,"Book",40)
		insert.execute(4,"Pencil",5)
		puts "Inserted"
          end
        

	    
	    rescue Mysql::Error => e
        	puts e
        
       end
     puts "Welcome to card"
     puts "1.Display Item"
     puts "2.Add Item"
     puts "3.Delete Item"
     puts "4.Update Item"
     puts "5.Exit"

     puts "Enter your choice:"
     ch=gets.to_i
     begin
      	case ch
      when 1
      	  display
      when 2
      		add
      when 3
      	   delete
      when 4
      	    exit
      
      else 
  	puts "Enter valid choice"
  	end
  	puts "Go to menu [y/n]"
  	@n=gets.to_i
end until @n=="n"
	
end
    end
 



	def display
		
	       result=@con.query("select * from ItemList")
	       rows=[]
	       table=Terminal::Table.new

	    while row=result.fetch_row do
	    	rows<<row
	    end
	    		table.rows=rows
	    		puts table

	      
	end 

	def add
			row = @con.query("select itemId from ItemList order by itemId desc limit 1")
             	
              	 id=row.fetch_row 
	    	       itemid=id[0].next
	    	    puts "Add Item Name:"
			       name=gets
			    puts "Enter Price"
			      price=gets.to_i 
             
		    @con.query("insert into ItemList(itemId,itemName,itemPrice)values('#{itemid}','#{name}','#{price}')")
             puts "Record added Successfully"
             result=@con.query("select * from ItemList")
	       rows=[]
	       table=Terminal::Table.new

	    while row=result.fetch_row do
	    	rows<<row
	    end
	    		table.rows=rows
	    		puts table
         
      end

      def delete
      	result=@con.query("select * from ItemList")
	       rows=[]
	       table=Terminal::Table.new

	    while row=result.fetch_row do
	    	rows<<row
	    end
	    		table.rows=rows
	    		puts table
      	puts "Enter Item Id which you want to delete"
      	delId=gets.to_i
      	del=@con.query("DELETE from ItemList where itemId='#{delId}'")
      	 puts "Item deleted Successfully"
      	result=@con.query("select * from ItemList")
	       rows=[]
	       table=Terminal::Table.new

	    while row=result.fetch_row do
	    	rows<<row
	    end
	    		table.rows=rows
	    		puts table
   
   end
   
end

ShoppingCart.new.connect 