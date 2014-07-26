require "mysql"

class Shop

	def initialize
	
		begin

	# mysql connectivity
			@con=Mysql.connect("localhost","root","root","shopping")
			
			puts "\t\t\t\t********shopping Cart**********\n\n"
		    puts "\t\t\t\t*******All Product In Stock*******\n\n"
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
        	 #puts "#{@pname}"
        	@quantity=row[2]
        	 #puts "#{@quantity}"
        	@prize=row[3]
        	 #puts "#{@prize}"
        
        	puts "\t\tproduct Id is:#{@pid}\t\tproduct name is :#{@pname}\t\tproduct quantity is :#{@quantity}\t\tproduct prize is :#{@prize}"
        	#puts "product quantity is:#{@quantity}" 
        	#puts "product prize is#{@prize}"
        end
       select
   end
   
   def select 

        print "\n\n\t\tselect Product Id"
        pid=gets.chomp
        @p_id=pid

        stmt2=@con.prepare("select pname,quantity,prize from product where pid=?")
        stmt2.execute(@p_id)
        row1=stmt2.fetch 
        @pname=row1[0]
        @quantity=row1[1]
        @prize=row1[2]
         puts "\t\tyour product info is\n"
         puts "\t\tproduct name is= #{@pname}\n"
         puts "\t\tproduct prize is= #{@prize}\n"

         select_again

end




def register_name

		print "\n\n\t\tEnter Your First Name: "
	
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

		print "\n\t\tEnter Your Mobile No.: "
		mobile=gets
		size=mobile.length
	    
	    if mobile=~ /\d{10}/ and size<12
          @mobile=mobile.to_i

			register
		else
			puts "\n\t\tInvalid Mobile No!!!...Enter Correct"
	
			register_cntno
		end
	end
	

    def register
		
		begin

	        
			statmt=@con.prepare("select uid from user")
			statmt.execute
            stmt3=@con.prepare("select cid from cart")
            stmt3.execute	
			while rs=statmt.fetch do
				
				id=rs[0]				
			end
	# id increment by 1
			@id=id.next


			while rs1=stmt3.fetch do
				
				cid=rs1[0]				
			end
	# id increment by 1
			@cid=cid.next




			stmt=@con.prepare("insert into user values(?,?,?)")
			stmt.execute(@id,@name,@mobile)

			stmt4=@con.prepare("insert into cart values(?,?)")
			stmt4.execute(@cid,@id)
             
			@con.commit

			puts "\n\n\t\t\t\t\tRegister Successfully...!!!"
	#call method 
			
		rescue Mysql::Error=>e

			puts "Error in Connection-.....#{e}"

		ensure

			@con.close if @connection

		end

	end

def select_again

			print "\n\t\t\tDo you want select product again(y/n)?: " 
				
				#get choice from user
					ch=gets.chomp
			
					if ch=="y"
						select
					elsif ch=="n"
						puts "\n\t\tThank You!!!"
					
						register_name
					else
						puts "\n\n\t\tInvalid Choice!!!...Try again"
					#call method select again
					select_again
	end	

	end

    end

 

    Shop.new