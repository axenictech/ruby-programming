require 'pg'
begin
	conn=PGconn.open(dbname:'ashraf')
	puts "connection established"
	#con=Mysql.new 'localhost','','','Ashraf'
	puts "connction established"
	puts "enter id:"
	id=gets.to_i
	puts "enter name:"
	name=gets
	puts "enter source:"
	source=gets
	puts "enter source:"
	destination=gets
	if src=source && dest=destination
		res=conn.exec('select payment from data where ')
	 	res.each do |a|
			puts a
		
	end	
rescue Exception=>e
	puts e

ensure 
	conn.close if conn

end
