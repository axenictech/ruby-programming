#program for creating Database connection and insrting and fetching
require "mysql"


	begin

		#connect to Database
		con=Mysql.connect("localhost","root","129129129","Test")
		puts"got connection......"

		stmt=con.prepare("insert into student values(?,?)")
		# stmt.execute(1,"Amar")
		# stmt.execute(3,"Ashraf")
		# stmt.execute(4,"Sudarshan")
		# stmt.execute(5,"Bhushan")
		
		

		con.commit
		puts"Record inserted successfully.........."


     	
        puts"id      Name      Collage"
  		res=con.query("select student.id,student.name,coll.colname from student,coll where student.id=1 and coll.id=1")
     	while row = res.fetch_row do
     		printf "\n%d",row[0]
        	printf "\t%s",row[1]
        	printf "\t%s",row[2]
        	puts
        end


	rescue Mysql::Error =>e
			puts"Eror--------->:#{e}"
			
   			

	ensure
		con.close
			
	end