require "mysql"
begin
	con = Mysql.connect('localhost','root','root','project')
    
    begin
	  
	    puts "**********Welcome*********"
	    puts "1.Book Fligth"
	    puts "2.Exit"

	    puts "Enter Your choice"

	    no=gets.to_i

	    case(no)
	    when 1

			 tno=0
			 # accept person info from passenger
			 puts "Enter your name"
			 name=gets.chomp

			 puts "Enter your cnt_no" 
			 cnt_no=gets.chomp

			 puts "enter your source"
	           source_g=gets.chomp

	           
	           puts "enter your dest"
                dest_g=gets.chomp
	          
                # check source and destination of passenger with flight
	           statmt=con.prepare("select pay from fligth where source=? and dest=?")
	           statmt.execute(source_g,dest_g)
                # Fetch data
	           rs=statmt.fetch
                pay=rs[0]
	           puts "you have to pay #{pay}"
                 
                 #insert passenger info into database
                stmt=con.prepare("insert into person(name,cnt_no) values(?,?)")
                stmt.execute(name,cnt_no)

                 #insert ticket info into database
                stmt=con.prepare("insert into ticket1 values(?)")
                stmt.execute(tno)
                rs=con.query("select tno from ticket1")
	                
	               while row=rs.fetch_row do
			 
			           tno=row[0]
                    end
   
                        tno.next

	                puts "the ticket no is #{tno}"
	     when 2
	     	break
	     else
	     	puts "wrong choice"
	end    
	puts "do you want continue [y/n]"
	@choice=gets
     end while(@choice=~/^[y]+$/)

end