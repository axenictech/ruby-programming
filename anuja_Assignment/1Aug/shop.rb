
require "mysql"
require "prawn"
require "prawn/table"
require 'terminal-table'
class Shop

	def initialize
	
	begin

	# mysql connectivity
			@con=Mysql.connect("localhost","root","root")
    
    # create database if not exists
			@con.query("create database if not exists\ abc")
			@con.query("use abc")
			@con.query("create table if not exists\ user(uid int primary key,uname varchar(20),cnt_no int,Address varchar(20))")
			@con.query("create table if not exists\ product(pid int primary key,pname varchar(20),quantity int,prize int)")
			@con.query("create table if not exists\ card(cid int primary key,uid int)")
			@con.query("create table if not exists\ inline1(cid int, foreign key(cid) references card(cid),pid int, foreign key(pid) references product(pid),quantity_i int)")
			@con.query("create table if not exists\ Order2(oid int primary key,cid int,foreign key(cid) references card(cid),total int)")
            stmt14=@con.query("select* from product")
            stmt15=@con.query("select* from user")
            stmt16=@con.query("select* from card")
            stmt17=@con.query("select* from Order2")

    #enter values if not in table        
            if (record1=stmt14.fetch_row).nil?
            
            	@con.query("insert into product values(1,'bag',200,300),
            		                                  (2,'books',200,30),
            		                                  (3,'saree',200,3000),
            		 		                          (4,'pd',200,500)")
           
            end
                         
            if (record2=stmt15.fetch_row).nil?
              @con.query("insert into user values(1,'anuja',1111111111,'pune')")
            end
              
            if (record3=stmt16.fetch_row).nil?
              @con.query("insert into card values(1,1)")
            end

             if (record4=stmt17.fetch_row).nil?
              @con.query("insert into Order2(oid) values(1)")
            end
             
		   
	         #call product method
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

		puts "\t\t\t\t********shopping Cart**********\n\n"
        stmt1=@con.query("select* from product")
        
        #fetch data from product table
           table = Terminal::Table.new
           rows=[]
		
		    	while row=stmt1.fetch_row do

				   table.headings=['id','name','quantity','price']
				   rows<<[row[0],row[1],row[2],row[3]]
			    end
			table.rows=rows
			puts "#{table}"
	    puts "\n\t\t*************Welcome in Magic Mall********************"
	    puts "\n\t\tFill the following details :- "
	    #call register_name method
	     register_name
    end
   
    def select 
        begin
         print "\n\n\t\tselect Product Id : "
         pid=gets
         
        if(pid=~/^[0-9]+$/)
         	 @p_id=pid.to_i
             stmt19=@con.prepare("select * from product where pid=?")
             stmt19.execute(@p_id)
               if(record8=stmt19.fetch).nil?
                 puts "\n\t\tEnter Correct Product ID"
               else
                 break
               end
         else
         	puts "\n\t\tEnter only digit"
         end
        end while(@p_id!=~ /^[0-9]+$/)              


         print "\n\n\t\tEnter how many quantity you want to purches : "
         @quantity_pc=gets.to_i

         stmt18=@con.prepare("select quantity from product where pid=?")
         stmt18.execute(@p_id)
         record7=stmt18.fetch
         quan=record7[0].to_i

         if (@quantity_pc<=quan)
           stmt6=@con.prepare("insert into inline1 values(?,?,?)")
           stmt6.execute(@c_id,@p_id,@quantity_pc)
           select_again
        else
        	puts "sorry stock is over"
     	    select
     end

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

        print "\n\t\tEnter Your Address : "
     	address=gets.chomp
		address_size=address.length
		if (address=~ /^[A-Z a-z]+$/) and (address_size>2 and address_size<21)
	        @address=address
	       register
		else
			puts "\n\t\t\t\tInvalid address!!!...Enter Correct"
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
        puts "\n\n\t\tLog In Successfully"

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

		 stmt15=@con.prepare("select p.pname,i.quantity_i, p.prize, (i.quantity_i * p.prize) from inline1 i,product p where i.cid=? and  p.pid=i.pid")
         stmt15.execute(@c_id)
       
         
					  card 
					  
					else
						puts "\n\t\tInvalid Choice!!!...Try again"
					#call method select again
					select_again
	               end	

   end

    def card	

		puts "\n\t\t\t\t your product  list "

		stmt21=@con.prepare("select i.pid,p.pname,p.prize,i.quantity_i,
			(p.prize*i.quantity_i) from inline1 i,product p where i.cid=? and p.pid=i.pid")
		stmt21.execute(@c_id)
		
		
           table2 = Terminal::Table.new
           rows=[]
		
		    	while row5=stmt21.fetch do

				   table2.headings=['Product Id','product Name','product price','product quantity','price total']
				   rows<<[row5[0],row5[1],row5[2],row5[3],row5[4]]
			    end
			table2.rows=rows
			puts "#{table2}"

			print "\n\t\tdo you want to delete product[y/n]"
			del=gets.chomp
			if del=="y"
				delete
            else
            	product_order
            end

        end



def delete

		print "\n\n\t\t\t\tEnter product id: "
		pid_d=gets.to_i

				stat22=@con.prepare("delete from inline1 where pid=? and cid=?")
				stat22.execute(pid_d,@c_id)
				puts "\n\t\tproduct deleted."
				print "\n\t\tdo you want del more product [y/n]"
		        del_mor=gets.chomp
		        if del_mor=="y"

				  delete
		else
		        product_order
		end
		
	end



    def product_order
           
           stmt16=@con.prepare("select sum(i.quantity_i * p.prize) from inline1 i,product p where i.cid=? and  p.pid=i.pid")
         stmt16.execute(@c_id)

         record5=stmt16.fetch
         @all=record5[0]
         
          print "\n \t\tyou total product price is #{@all}\n"

           
			statement12=@con.prepare("select pid from inline1 where cid=?")
			statement12.execute(@c_id)
			
			while recordset12=statement12.fetch do

				statement13=@con.prepare("update product set quantity=quantity-(select quantity_i from 
					inline1 where pid=? and cid=?) where pid=?")			
				statement13.execute(recordset12[0],@c_id,recordset12[0])
				
			end


	       print "\n \t\tDo you want to order products(y/n)?: " 
				
				#get choice from user
				ch1=gets.chomp
			        
			        if ch1=="y"


			              bill
					
					elsif ch1=="n"
						
						puts "\n\t\tThank You!!!"
					else
						puts "\n\n\t\tInvalid Choice!!!...Try again"
					
					    #order_product_choice
	               end
	end

   def bill

         puts "\n*******************************BILL*********************"
         stmt7=@con.prepare("select u.uname,u.cnt_no,u.Address from user u,card c where u.uid=c.uid and c.cid=?")
         stmt7.execute(@c_id)
         row2=stmt7.fetch
        
         stmt9=@con.prepare("select p.pname,i.quantity_i, p.prize, (i.quantity_i * p.prize) from inline1 i,product p where i.cid=? and  p.pid=i.pid")
         stmt9.execute(@c_id)
       
         stmt10=@con.prepare("select sum(i.quantity_i * p.prize) from inline1 i,product p where i.cid=? and  p.pid=i.pid")
         stmt10.execute(@c_id)
         row6=stmt10.fetch

			

         @total=row6[0]
         

         table1 = Terminal::Table.new
               rows=[]
               table1.headings=['name','cnt no','Address']
               rows<<[row2[0],row2[1],row2[2]]
               rows<<[""]
               rows<<['','','','']
               rows<<['product name','per/product Rs','quantity','Price']
		        rows<<[""]
		    	while row=stmt9.fetch do
				   
				   rows<<[row[0],row[2],row[1],row[3]]
			    
			    end
			    rows<<[""]
	            rows<<['','','Total',row6[0]]

                table1.rows=rows
			    puts "#{table1}"

                    
          Prawn::Document.generate("shopping.pdf") do
           table rows
          end
               

                puts "\n\nthank you, your product will be delivered within 10 working days."
         	

                statmt2=@con.prepare("select oid from Order2")
		        statmt2.execute

                      while rs2=statmt2.fetch do
				         id2=rs2[0]				
			          end
	               # id increment by 1
			       @o_id=id2.next
                


          
               stmt11=@con.prepare("insert into Order2 values(?,?,?)")
               stmt11.execute(@o_id,@c_id, @total)


end
end   
Shop.new
