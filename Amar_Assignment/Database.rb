#program for creating Database connection and insrting and fetching
require "mysql"


	begin

		#connect to Database
		con=Mysql.connect("localhost","root","129129129","Test")
		puts"got connection......"

		stmt=con.prepare("insert into stud values(?,?)")
		stmt.execute(1,"Amar")
		stmt.execute(3,"Ashraf")
		stmt.execute(4,"Sudarshan")
		stmt.execute(5,"Bhushan")
		
			

		con.commit
		puts"Record inserted successfully.........."


     	
        
  		res=con.query("select * from stud")
     	while row = res.fetch_row do
     		printf "\nId: %d",row[0]
        	printf "\nName: %s",row[1]
        end


	rescue Mysql::Error =>e
			puts"Eror--------->:#{e}"
			
   			

	ensure
		con.close
			
	end