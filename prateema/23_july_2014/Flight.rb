require 'mysql'

class Flight
    attr_accessor :name,:address,:age,:id
<<<<<<< HEAD

    #initialize method for connection
    def initialize
    begin
        
        @conn=Mysql.connect("localhost","root","root","prateema")
        @conn.query("CREATE TABLE IF NOT EXISTS person_det(id int primary key AUTO_INCREMENT,name varchar(20),address varchar(20),age int,password varchar(20),email varchar(20))")
        menu
    #exception if connection not established    
=======
    def initialize
        @conn = Mysql.connect("localhost", "root", "root","prateema")
         menu

>>>>>>> 6c4327f1838cf04ea2c2a6c438b22c2a2f879aea
      rescue Mysql::Error=>e 
        puts "Connection error"

      ensure
<<<<<<< HEAD
        @conn.close if @conn
     	end
   end  

   #MENU method for selection the application operation
   def menu

      puts "\n\t\t\tWelcome to IBIBO flight book"
       
      puts "\n\t\t\t 1.Book a flight"
			puts "\n\t\t\t 2.Check Flight"    
      @choice=gets.to_i

      case @choice
        	when 1 then
          	  accept_name
        	when 2 then
          	  available_flight
        	else
          		puts "Wrong choice"

      end



  	end

    # taking name of passenger
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

    #taking address of passenger
    def accept_address

      puts "Enter Address:"        
      @address=gets
  		if (@address=~/^[a-z]+$/) then 
      	puts "\t\t\tAccepted"
      	accept_age
    	else
      	puts "\t\t\tThe #{@address} entered is improper PLEASE ENTER A VALID ADDRESS"
      	accept_address
    	end

    end

   # taking age 
	def accept_age

      puts "Enter Age:"        
      @age=gets.to_i
    if(@age>=1 and @age<=99) then 
      puts "\t\t\tAccepted"
      accept_email
    else
    	puts "VALID age"
    	accept_age
    end	
      
		accept_email


	end


  # ENTER THE EMAIL ADDRESS

	def accept_email
		puts "enter email address"
		@email=gets
		# if (@email=~/^[A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"+"[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"/) then 
		if(@email=~/[a-z]+$/)
      puts "\t\t\tAccepted"
    check_entry

   
    else
      puts "\t\t\tinvalid format"
      accept_email
    end


	end
 	
 	#cheking if entry available
	def check_entry

	check_insert=@conn.prepare("SELECT name FROM person_det WHERE name=?")
					check_insert.execute(@name)
					
           # print "\n\t\tNAME \t\tADDRESS\t\tAGE"
           rs=check_insert.fetch 
           if rs.nil? 
           insert_new=@conn.prepare("INSERT INTO person_det(name,address,age,email) VALUES (?,?,?,?)")	
           insert_new.execute(@name,@address,@age,@email)
           @conn.commit
           puts "BOOK A FLIGHT??"
           @book_me=gets
           		if (@book_me=~/^[y]+$/)
           				booking_ticket

          		 else
           				exit-1
           		end


          else
          puts "Already a REGISTERED book a ticket?"
          @book_me=gets
          booking_ticket
        	end

	end



     #booking tickets
     def booking_ticket
     			
     	puts "\t\t flight DEPARTURE  place"
     	@depart=gets.chomp.to_s
       
     	if (@depart=~/^[a-zA-Z]+$/)then 

		     
		      	if(@depart == "mumbai")
		      		@air_fare=1200
		      	elsif (@depart == "pune") 
		      	 	@air_fare=456
		      	elsif(@depart=="delhi") 
		      	 	@air_fare=2344
						elsif(@depart=="dubai")
		      		@air_fare=6744
		      	elsif(@depart=="goa")
		      		@air_fare=902
		      	elsif(@depart=="chennai")
		      		@air_fare=784
		      	elsif(@depart=="kolkata")
		      		@air_fare=784
			    else 
			     	puts "FLIGHT from this city is not available"
     		 end	

      	else
	      	puts "Enter the name of city properly"
	      	booking_ticket		
     	end


     		puts "\t\t flight ARRIVAL  place"
     		@arrival=gets.chomp.to_s
      		# puts @arrival.inspect
		     	if (@arrival=~/^[a-zA-Z]+$/)then 

		     
		      	if(@arrival == "mumbai")
		      		@to_fare=1200
		      	elsif (@arrival =="pune") 
		      	 	@to_fare=456
		      	elsif(@arrival=="delhi") 
		      	 	@to_fare=2344
				elsif(@arrival=="dubai")
		      		@to_fare=6744
		      	elsif(@arrival=="goa")
		      		@to_fare=902
		      	elsif(@arrival=="chennai")
		      		@to_fare=784
		      	elsif(@depart=="tamilnadu")
		      		@air_fare=784
			    else 
			     	puts "FLIGHT from this city is not available"
     		 end	

      	else
	      	puts "Enter the name of city properly"
	      	booking_ticket		
     	end


     	 calculate_fare



     end

     
def confirm_register
	
			puts "\t\tConfirm REGISTERATION?"
	    @answer=gets
	    puts ans=@answer
    		if(ans=~/^[y]+$/) 
    			insert_reg=@conn.prepare("INSERT INTO person_det(name,address,age)VALUES(?,?,?)")
    			insert_reg.execute(@name,@address,@age)
    			@conn.commit
    			puts "data  inserted from REGISTERATION"
  		  else
   			 	puts "nai zhale REGISTERATION"

   			end



	end

=======
        @conn.close
    end  


    def menu
      puts "\n\t\t\tWelcome to IBIBO flight book"
       
      puts "\n\t\t\t 1.Book a flight"
      puts "\n\t\t\t 2.Check available flight"
      puts "\n\t\t\t 3.Check available flight and fare"

      choice=gets.to_i

      case choice
        when 1 then
            accept_details
        when 2 then
            available_flight
        when 3 then
            available_flight_fare
        else
          puts "Wrong choice"

        end



    end

    def accept_name

   puts "Enter name:"        
      @name=gets
   if (@name=~/^[a-zA-Z],{3,15}/) then 
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
   if (@address=~/^[a-zA-Z],{4,16}/) then 
      puts "\t\t\tAccepted"
      accept_age
    else
      puts "\t\t\tThe #{@address} entered is improper PLEASE ENTER A VALID ADDRESS"
      accept_address
    end

    end

def accept_age

      puts "Enter Age:"        
      @address=gets
   if (@address=~/^[0-9],{1,2}/) then 
      puts "\t\t\tAccepted"
      display_details
    else
      puts "\t\t\tThe #{@address} entered is improper PLEASE ENTER A VALID ADDRESS"
      accept_age
    end

    end

def display_details
      insert_in=@conn.prepare("insert into preson_det(name,address,age) values(?,?,?)")
      insert_in.execute(@name,@address,@age)
      insert.commit


      display_insert=@conn.query("select * from booking where name=@name")

          print "\n\t\tNAME \t\tADDRESS\t\tAGE"
          while row=display_insert.fetch_row  do 
          print "\n\t\t#{row[0]} \t\t#{row[1]} \t\t #{row[2]}"
        

end
>>>>>>> 6c4327f1838cf04ea2c2a6c438b22c2a2f879aea
    def available_flight

      available_f=@conn.query("select source,destination from booking ")

          print "\n\t\tSOURCE \t\tDESTINATION"
          while row=available_f.fetch_row  do 
          print "\n\t\t#{row[0]} \t\t#{row[1]}"
          
          puts "\n"
<<<<<<< HEAD
      	  end 
      	  puts "AGAIN To THE MENU"	
      	  menu
     end

     #claculation of the fare
     def calculate_fare
     	
	     	
     	if(@depart=~/^[mumbai]+$/ and @arrival=~/[pune]+$/) then
     		@tot_fare=(@air_fare*@to_fare).to_i
     		@cost=@tot_fare.to_i
     	elsif (@depart=~/[delhi]+$/ and @arrival=~/[chennai]+$/) then
     		@tot_fare= @air_fare * @to_fare
     	elsif (@depart=~/[mumbai]+$/ and @arrival=~/[delhi]+$/) then
     		@tot_fare= @air_fare * @to_fare

     	elsif (@depart=~/[chennai]+$/ and @arrival=~/[goa]+$/) then
     		@tot_fare= @air_fare * @to_fare

     	elsif (@depart=~/[banglore]+$/ and @arrival=~/[goa]+$/) then
     		@tot_fare= @air_fare * @to_fare

     	end	
     	
     	puts @tot_fare.to_i		

     	
     	f=@tot_fare.to_i
     	d=@depart
     	a=@arrival
     	puts " FLIGHT booking conformation form city:  #{d}\t to #{a} cost\tfare #{f}"
     	book_insert=@conn.prepare("INSERT INTO booking(source,destination,fare)VALUES(?,?,?)")
     	book_insert.execute(@depart,@arrival,@cost)
     	@conn.commit
     	



     		print_details

     end

     def print_details
   	 		n=@name
    	 	a=@address
     		ag=@age
    		t=Time.new
    		tn=t.to_i
   		  f=@tot_fare.to_i
    		d=@depart
    		a=@arrival
     	
     print "\n----------------------------------------------------------------"	
     print " \nNAME:#{n} \t\tADDRESS:#{a} \t\t AGE:#{ag}\t\t"
     print " \nFLIGHT: FA#{tn} \tDEPARTURE:#{d} \t ARRIVAL: #{a} \t "
     print " \nFARE: #{f}"
     print "\n------------------------------------------------------------------"
     print "\n"




     end
=======
     end

     def available_flight_fare

        available_ff=@conn.query("select * from booking ")

          print "\n\t\tSOURCE \t\tDESTINATION\t\tFARE"
          while row=available_ff.fetch_row  do 
          print "\n\t\t#{row[0]} \t\t#{row[1]} \t\t #{row[2]}"
          
          puts "\n"
     end

    end

  end 
>>>>>>> 6c4327f1838cf04ea2c2a6c438b22c2a2f879aea
end

Flight.new

<<<<<<< HEAD
 
=======
>>>>>>> 6c4327f1838cf04ea2c2a6c438b22c2a2f879aea
