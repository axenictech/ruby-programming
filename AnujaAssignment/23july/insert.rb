require "mysql"
begin
	con = Mysql.connect('localhost','root','root','anuja')
	#stmt=con.prepare("insert into emp1(name,city) values(?,?)")
	#stmt.execute("axenic","pune")
	#stmt.execute("tech","anagar")
    con.query("update stud set name='tina' where roll_no=102")

	  puts "The query has affected #{con.affected_rows} rows"
	  rs=con.query("select*from stud")
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