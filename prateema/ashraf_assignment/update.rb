require 'mysql'
begin
con=Mysql.new 'localhost','root','root','Ashraf'
puts "connection established"
pst = con.prepare "update info set name=? where id=?"
pst.execute "asif","1"
pst.execute "amar","2"

con.commit
puts "2 records update successfully"

rescue Mysql::Error =>e
	puts e
ensure 
con.close if con
pst.close if pst
end
