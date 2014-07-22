require 'mysql'

begin
	con=Mysql.new  'localhost','root','root','Ashraf'
	pst=con.prepare("insert into info(id,name)values(?,?)",5,"ashraf")
	pst.execute
	con.commit
	pst.commit
rescue Mysql::Error=>e
	puts e
ensure 
	puts con.close if con
	puts pst.close if pst
end
