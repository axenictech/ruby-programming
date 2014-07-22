require 'mysql'

name="pateema"

begin


	con=Mysql.new 'localhost','root','root','Ashraf'
	puts "connection established"
	pst=con.prepare "insert into info(name) values (?)"
	
	pst.execute name
	puts " records inserted done."	
	con.commit
rescue Mysql::Error =>e
	puts e
ensure 
	con.close if con
	pst.close if pst
end
	
