require 'dbi'
# require 'Mysql'
begin
     # connect to the MySQL server
     dbh = DBI.connect("DBI:Mysql:prateema:localhost", 
	                    "root", "root")
     # get server version string and display it
     puts "connected"

     create a table in database "prateema"

     crdata=dbh.query("create table if not exists employeedet(empid int primary key,name varchar(20),empadd varchar(20),empemail varchar
          (20))")
     begin 
     puts ("creating the database for table employeedet")     
     insrtdata=dbh.prepare("insert into employeedet(empid,name,empadd,empemail) values(?,?,?,?)")
     puts("Enter the Employee Id")
     empid=gets

     puts("Enter the Employee name")
     name=gets
     
     puts("Enter the Employee address")
     empadd=gets
     
     puts("Enter the Employee email")
     empemail=gets
     
     stat.execute(empid,name,empadd,empemail)
          dbh.commit
     puts ("create another  entery y/n")
     end while(choice=~/^y/)


     rescue DBI::ProgrammingError => error
        print error
        print "\n"


     res=conn.query("SELECT * FROM employeedet")
     while row=res.fetch_row  do  
          puts "name: #{row[0]}"
          puts "\t\tid: #{row[1]}"
          puts "\t\taddress: #{row[2]}"
          puts "\n"
     end



     dbh.disconnect if dbh                        
end