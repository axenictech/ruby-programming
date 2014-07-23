 require "pg"

     # connect to the MySQL server
     #con = pg.new 'localhost','root','root','my'
     # get server version string and display it
     

  begin
#conn = PGconn.open(dbname:'info')
conn = PGconn.connect('localhost', 5432, '', '', 'student','anuja','root')
 
     puts "connection established"


      rs=conn.exec('select* from emp')

      rs.each do | row | 
          
          row.each do |column|

               puts column
                 
          end

       


     end
          
     
rescue Exception => e
     puts e
ensure
     # disconnect from server
     conn.close if conn
end
