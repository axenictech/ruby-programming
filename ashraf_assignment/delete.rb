require 'mysql'
#id=6
#name="tanvi"

begin
	con=Mysql.new 'localhost','root','root','Ashraf'
	con.query "delete  from info where id in(2,6)"
	puts "#{con.affected_rows} rows are deleted"
	puts "record successsfully deleted"
rescue Mysql::Error =>e
	puts e.errno
	puts e.error
ensure
	con.close if con
	#pst.close if pst
end
