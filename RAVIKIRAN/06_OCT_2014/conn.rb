require "mysql"  	#this mysql module provided by mysql to use for connectivity

			begin
				
			    connection=Mysql.connect("localhost","root","root","test")
			    
			    puts "Connection Successfully"
			    rs = connection.query('select * from student')  
				rs.each_hash { |h| puts h}
				puts "ok"

			rescue Mysql::Error=> e   #rescue useing for exception handling and Mysql::Error is exception class
			    
       			    puts "Error in Connection.....#{e}"

			ensure                     #ensure is like final block in java
			
			    connection.close if connection

			end


#			rs.each do |row|
 #           puts row.join("\s")
  #          $bproduct=row[1]
   ##         $bprice=row[2]
     #       puts "#{bproduct}"
      #      puts "#{bprice}"
    	#	end