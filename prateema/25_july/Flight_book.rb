
require "mysql"

begin
     # connect to the MySQL server

     conn = Mysql.connect("localhost", "root", "root","prateema")
     
     # get server version string and display it
   
      begin 
     	# # statment=conn.query("create table if not exists\ person_det(id int primary key,name varchar(20),address varchar(20),age int)")
     	# stat= conn.prepare("INSERT INTO person_det(id,name,address,age) VALUES(?,?,?,?)")
   		

     	# puts "Enter ID "
     	# id=gets.to_i
         
      #     puts "Enter name"
      #     name=gets
          
     	# puts "Enter address"
     	# address=gets

      #     puts "Enter age"
      #     age=gets

     	# stat.execute(id,name,address,age)
     	# conn.commit

     	
          # stat_book=conn.prepare("insert into booking(source,destination,fare) values(?,?,?)")

          puts "Enter source"
          source_new=gets.chomp

          puts "Enter destination"
          destination_new=gets.chomp

          
          stat_fare=conn.prepare("select fare from booking where source=? and destination=?")
          stat_fare.execute(source_new,destination_new)
          rs=stat_fare.fetch
          pay=rs[0]
          puts "Your fare #{pay}"
         
     end
          
          

     puts "Is the Fare acceptable for you.?"
     # choice=gets
     # if(choice=~/^yes/) then
     #      stat_ticket_generation=conn.prepare("insert into ")

          

          

          


          

     conn.close
    
     

   
end