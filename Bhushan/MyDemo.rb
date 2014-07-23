require "mysql"

begin
	con=Mysql.connect('localhost','root','root','MyDB')
	ri=con.query("select * from empl")
	row=ri.num_rows
	row.times do
		puts ri.fetch_row.join("\s")
end	
	rescue Mysql::error => e
		puts #{e}
	
ensure
	con.close if con

end