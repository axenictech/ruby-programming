require "pg"
begin
	puts "connected"
	con=PGconn.connect(dbname:'mydata')
	
		statment=conn.query("create table if not exists\ myplan(name varchar(20),id int,address varchar(20))")
     	stat= conn.prepare("INSERT INTO myplan (name,id,address) VALUES(?,?,?)")
   		

     	puts "Enter name "
     	name=gets
     
     	puts "Enter id"
     	id=gets.to_i
     
     	puts "Enter address"
     	address=gets

     	stat.execute(name,id,address)
     	conn.commit

     	puts "create Next Entry yes/no"
     	choice=gets
     	end while (choice=~/^y/)
    

     res=conn.query("SELECT * FROM myplan")
     while row=res.fetch_row  do 
          puts "name: #{row[0]}"
          puts "id: #{row[1]}"
          puts "address: #{row[2]}"
          puts "\n"
     end
     



end