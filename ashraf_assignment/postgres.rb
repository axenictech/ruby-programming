require 'pg'
begin
	conn=PGconn.open(dbname:'ashraf')
	#conn=PGconn.connect('localhost',5432,'','','ashraf','ashraf','root')
	puts "coonection establishedss"
	res=conn.exec('select * from info where id<3')
	
	res.each do |row|
	
 	 
	puts row
	
	end
	 
rescue Exception=>e
puts e
ensure 
	puts conn.close if conn
end
