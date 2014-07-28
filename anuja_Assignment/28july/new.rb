require "mysql"

require 'terminal-table'
class Shop

	def initialize
	
		begin

	# mysql connectivity
			@con=Mysql.connect("localhost","root","root","shop")

			@con.query("create database if not exists\ shop")
			@con.query("create table if not exists\ user(uid int primary key,uname varchar(20),cnt_no int)")
			@con.query("create table if not exists\ product(pid int primary key,pname varchar(20),quantity int,prize int)")
			@con.query("create table if not exists\ card(cid int primary key,uid int)")
			@con.query("create table if not exists\ inline1(cid int, foreign key(cid) references card(cid),pid int, foreign key(pid) references product(pid),quantity_i int)")
			@con.query("create table if not exists\ Order2(oid int primary key,cid int,foreign key(cid) references card(cid),total int)")

			puts "\t\t\t\t********shopping Cart**********\n\n"
		   
	#call menu method
	        product
		    	
	# handle ecxception
		rescue Mysql::Error=>e

			puts "Error in Connection-.....#{e}"

		ensure
	# close connection
			@con.close if @con

		end

	end

	def product
        stmt1=@con.query("select* from product")
        while row=stmt1.fetch_row do 
        	@pid=row[0]
        	  #puts "#{@pid}"
        	@pname=row[1]
        	 #pnuts "#{@pname}"
        	@quantity=row[2]
        	 #puts "#{@quantity}"
        	@prize=row[3]
        	 #puts "#{@prize}"
        
        	puts "\t\tproduct Id is:#{@pid}\t\tproduct name is :#{@pname}\t\tproduct quantity is :#{@quantity}\t\tproduct prize is :#{@prize}"
        	#puts "product quantity is:#{@quantity}" 
        	#puts "product prize is#{@prize}"
        end
            register_name
   end
   
   def select 

        print "\n\n\t\tselect Product Id : "
        pid=gets.chomp
        @p_id=pid

        stmt2=@con.prepare("select pname,quantity,prize from product where pid=?")
        stmt2.execute(@p_id)
        row1=stmt2.fetch 
        @pname=row1[0]
        @quantity=row1[1]
        @prize=row1[2]
         # puts "\t\tyour product info is\n"
         # puts "\t\tproduct name is= #{@pname}\n"
         # puts "\t\tproduct prize is= #{@prize}\n"

        print "\n\n\t\t Enter how many quantity you want to purches : "
        @quantity_pc=gets.to_i



        # stmt5=@con.prepare("select cid from cart order by cid desc limit 1")
        #         stmt5.execute	

        #              rs1=stmt5.fetch 
			     #     cid=rs1[0]				
	          
	       #           @c_id=cid.next

               stmt6=@con.prepare("insert into inline1 values(?,?,?)")
               stmt6.execute(@c_id,@p_id, @quantity_pc)
        
               select_again

end




def register_name

		print "\n\n\t\tEnter Your First Name :-"
	
		name=gets.chomp
		name_size=name.length
		if (name=~ /^[A-Z a-z]+$/) and (name_size>2 and name_size<21)
	
			@name=name
	
			register_cntno
		else
			puts "\n\t\t\t\tInvalid Name!!!...Enter Correct"
	# call method register_name
			register_name
		end
	end

def register_cntno

		print "\n\t\tEnter Your Mobile No. : +91 "
		mobile=gets
		size=mobile.length
	    
	    if mobile=~ /\d{10}/ and size<12
          @mobile=mobile.to_i

			register_address
		else
			puts "\n\t\tInvalid Mobile No!!!...Enter Correct"
	
			register_cntno
		end
	end

def register_address

		print "\n\t\tEnter Your address : "
		address=gets
		size=address.length
	    
	    if size>3 or size<20
          @address=address.to_s

			register
		else
			puts "\n\t\tInvalid Mobile No!!!...Enter Correct"
	
			register_address
		end
	end
	

    def register
		
		begin

	        
			statmt=@con.prepare("select uid from user")
			statmt.execute

            
            while rs=statmt.fetch do
				
				id=rs[0]				
			end
	# id increment by 1
			@id=id.next
            
            stmt=@con.prepare("insert into user values(?,?,?,?)")
			stmt.execute(@id,@name,@mobile,@address)



            statmt1=@con.prepare("select cid from card")
			statmt1.execute

            
            while rs1=statmt1.fetch do
				
				id1=rs1[0]				
			end
	# id increment by 1
			@c_id=id1.next



            stmt1=@con.prepare("insert into card values(?,?)")
			stmt1.execute(@c_id,@id)
          
            puts "\n\n\t\t\tRegister Successfully"

           select
	
			@con.commit

		rescue Mysql::Error=>e

			puts "Error in Connection-.....#{e}"

		ensure

			@con.close if @con

		end

	end

def select_again

			print "\n\t\tDo you want select product again(y/n)? : " 
				
				#get choice from user
					ch=gets.chomp
			
					if ch=="y"
						select
					elsif ch=="n"
						puts "\n\t\tThank You!!!"
					    product_order 
					  
					else
						puts "\n\t\tInvalid Choice!!!...Try again"
					#call method select again
					select_again
	               end	

end

def product_order

	   print "\n\t\t\tDo you want order product(y/n)?: " 
				
				#get choice from user
					ch1=gets.chomp
			
					if ch1=="y"

					
					 bill
					elsif ch1=="n"
						puts "\n\t\tThank You!!!"
					
				    else
						puts "\n\n\t\tInvalid Choice!!!...Try again"
					
					order_product_choice
	               end
	end

def bill

         puts "\t\t\t*******************************BILL****************************************"
         stmt7=@con.prepare("select u.uname,u.cnt_no,u.Address from user u,card c where u.uid=c.uid and c.cid=?")
         stmt7.execute(@c_id)
         row2=stmt7.fetch
         @uname=row2[0]
         @cnt_no=row2[1]
         @add=row2[2]
         puts "\t\t\tname :#{@uname}\t\tcnt no : #{@cnt_no}\t\t address : #{@add}"
        
     
 

       
         stmt9=@con.prepare("select p.pname,i.quantity_i, p.prize, (i.quantity_i * p.prize) from inline1 i,product p where i.cid=? and  p.pid=i.pid")
         stmt9.execute(@c_id)
       
         stmt10=@con.prepare("select sum(i.quantity_i * p.prize) from inline1 i,product p where i.cid=? and  p.pid=i.pid")
         stmt10.execute(@c_id)
         row6=stmt10.fetch

         @total=row6[0]


         while row5=stmt9.fetch do
           @pname=row5[0]
           @quant=row5[1]
           @price=row5[2]
           @price_total=row5[3]
           #@total=row5[4]          
           
           puts "\n\t\tname is: #{@pname}\t\tprice is: #{@price}\t\t quantity is: #{@quant}\t\ttotal price is: #{@price_total}"
          
          end

          table = Terminal::Table.new do |t|
  t << ['One', 1]
  t << :separator
  t.add_row ["Two\nDouble", 2]
  t.add_separator
  t.add_row ['Three', 3]
end

         





	 
         puts "\t\t\t\t\t\t\t\t\t\t\ttotal is: #{@total}"

         puts "thank you, your product will be delivered within 10 working days."

          stmt11=@con.prepare("insert into Order2 values(?,?,?)")
               stmt11.execute(@c_id,@c_id, @total)


end
end
   
Shop.new
