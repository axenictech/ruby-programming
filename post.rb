require "pg"
require "terminal-table"
class Postgres
  
  	def connect
    	begin
			@con=PGconn.connect( "localhost",5432,'','',"sayali", "sayali","sayali")
			 @con.exec("create table if not exists \ student (id int,name varchar);")
			puts "table create"
			begin
				
			
			puts "enter id:"
			id=gets.to_i
			puts "enter name:"
			name=gets

			@con.exec("insert into student(id,name)values('#{id}','#{name}');")
			puts "insert"
              result=@con.query("select * from student")
	                rows=[]
	        table=Terminal::Table.new

	           result.each  do |row|
	            row.each do |col|
                 rows<<col
	    end
	end
	    		 table.rows=rows
	    		puts table

            puts "want to continue[y/n]"
            @n=gets.chomp
           end until @n=="n"
          
		rescue Exception => e
			puts "Error in connection.....#{e}"
		end
	end
 end
 Postgres.new.connect



			