
require "mysql"
begin
     # connect to the MySQL server
     con = Mysql.new 'localhost','root','root','anuja'
     # get server version string and display it
     
     rs=con.query("select*from demo1")
     no_row=rs.num_rows
     puts "the no of row #{no_row}"
     no_row.times do
       puts rs.fetch_row.join("\s")  
     end
          
     
rescue Mysql::Error => e
     puts e.errno
     puts e.error
     
ensure
     # disconnect from server
     con.close if con
end