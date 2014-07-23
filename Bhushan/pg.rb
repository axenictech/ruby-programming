require "pg"
begin
	puts "connected"
	con=PGconn.connect(dbname:'axenic')
	result=con.exec("select * from emp") 
	
	# result.each do |row|
	# 	row.each do |column|
	# 		p column
	# 		puts
	# 	end

	

	# num=con.no_rows

	# no_rows.times  do
	# puts result.fetch_row.join("\s")
	end	


rescue Exception => e
	puts e


ensure 
	con.close if con
end