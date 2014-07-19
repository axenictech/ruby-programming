# require "rubygems"   

 require "mysql"

     begin

     # connect to the MySQL server

     con=Mysql.new 'localhost','root','root','mysql'
     # re=con.query("Select * from MyDemo1")
     # re.each do |i| 
     # puts i.row.join("\s")
     # end
     puts
     puts
     puts "Connection Succesfully" 
     puts
     con.prepare("CREATE TABLE EMPLOYEE1 (
     FIRST_NAME  CHAR(20) NOT NULL,
     LAST_NAME  CHAR(20),
     AGE INT,  
     SEX CHAR(1),
     INCOME FLOAT )" );
     puts "table Creaated"


     # get server version string and display it

     # puts "Server version: " + db.get_server_info


   rescue Mysql::Error => e

     puts "Error code: #{e.errno}"

     puts "Error message: #{e.error}"

     puts "Error SQLSTATE: #{e.sqlstate}" if e.respond_to?("sqlstate")

   ensure

     # disconnect from server

     con.close if con

   end