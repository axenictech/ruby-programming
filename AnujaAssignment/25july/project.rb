require "mysql"
begin
	con = Mysql.connect('localhost','root','root','project')
	
	begin

		puts "\n\t\t\t**********Welcome*********"
		puts "\n\t\t\t1.Book Fligth"
		puts "\n\t\t\t2.Exit\n\n"
        #accept choice from user
		print "\t\t\tEnter Your choice : "

		no=gets.to_i

		case(no)
		when 1

			 #tno=0
			 # accept person info from passenger
			 begin
			 print "\t\t\tEnter your name (*name should be Max 15 char and Min 3 char:) "
			 name=gets.chomp
             name_size=name.size 
              #validation for name
             end while (name!=~ /^[A-Z a-z]+$/) && (name_size<3) || (name_size>15)
                

             begin
			 print "\t\t\tEnter your cnt_no : (*phon num should be  10:)"
			 cnt_no=gets.chomp
			 mobile=cnt_no.size
               #validation for phon num
             end while(cnt_no!=~ /\d/ and mobile<=9) || (mobile>=11)
               #fetch pass_id from database
	     	 stmt1=con.prepare("select pid from pass")
			 stmt1.execute
	         
	            while rs=stmt1.fetch do
				    pid=rs[0]				
			    end
	
			 pid=pid.next
               #insert passenger info into database
		     stmt=con.prepare("insert into pass(pid,name,cnt_no) values(?,?,?)")
			 stmt.execute(pid,name,cnt_no)
               
             print "\t\t\tenter your source : "
			 source_g=gets.chomp

			 print "\t\t\tenter your dest : "
			 dest_g=gets.chomp

			 # check source and destination of passenger with flight
			   
			 statmt=con.prepare("select fid,pay from flight where source=? and dest=?")
			 statmt.execute(source_g,dest_g)
			  
			  # Fetch data
			  
			  rs=statmt.fetch
			  fid=rs[0]
			  pay=rs[1]
			  puts "\n\t\t\tyou have to pay #{pay}"
			 #fetch ticket no from database
		      rs1=con.prepare("select tno from ticket")
			  rs1.execute
					while row=rs1.fetch do
			           tno=row[0]
					end
              ticket=tno.next
			  puts "\n\t\t\tthe ticket no is #{ticket}"
               #insert ticketno,passenger_id,flight_id into database
			  stmt2=con.prepare("insert into ticket values(?,?,?)")
			  stmt2.execute(ticket,fid,pid)
              #confirming the booking
              print "\n\t\t\tAre you want to book ticket(yes/no)?:" 
	          ch=gets.chomp
              if ch=="yes"
			  
			  #fetch flight_id and passenger_id from ticket table 
		      stmt3=con.prepare("select fid,pid from ticket where tno=?")
			  stmt3.execute(ticket)
			  stmt4=stmt3.fetch
			  F_id=stmt4[0]
			  p_id=stmt4[1]
              #fetch passenger name 
			 stmt5=con.prepare("select name from pass where pid=?")
			 stmt5.execute(p_id)
             recs=stmt5.fetch
             name=recs[0]
             #fetch source,destination, and pay
			 stmt6=con.prepare("select source,dest,pay from flight where fid=?")
			 stmt6.execute(F_id)
             recs1=stmt6.fetch
             source=recs1[0]
			 dest=recs1[1]

			  #print ticket
			  puts "\n\t\t\t*******Your Ticket Info*****"
			  puts "\n\t\t\tyour ticket No is : #{ticket}"
			  puts "\n\t\t\tpassenget name is : #{name}"
			  puts "\n\t\t\ttravalling From   : #{source} to #{dest}"
			  puts "\n\t\t\tyou have to pay   : #{pay}"
              
              else ch=="no"
		      puts "\n\t\t\t\tThank You"
		      end
              
			when 2
				    #exit
			        break
				 else
				 	#print for wrong condition
			        puts "wrong choice"
	    end    
	
	puts "do you want continue [y/n]"
	@choice=gets
	end while(@choice=~/^[y]+$/)

end