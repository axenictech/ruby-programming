

require "mysql"
# connect to the mysql server
#	con=Mysql.new 'localhost','root','root'


begin
    con = Mysql.new 'localhost', 'root', 'root','mysql'
    rs= con.query("Select * from info")
	rs.each do |c|
	puts c.join("\t")
	end
rescue Mysql::Error => e
    puts e.errno
    puts e.error
    
ensure
    con.close if con
end


=begin
rescue Mysql::error =>e
puts e.errno
puts e.error

ensure
con.close if con
=end
