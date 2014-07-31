require "mysql"

class School

def initialize

		begin
				#creating connection to mysql
				@cn=Mysql.connect("localhost","root","root","kanishk")
				puts"connection sucessfully"
				#creation of table
				@cn.query("create table if not exists\ schoolinfo(roll_no int,name char(20),marks int)")
				
				getdata

		rescue Mysql::Error=>e
				puts "Error in Connection-.....#{e}"

				#ensure is used to excute what you want to excute compulsary
	    ensure

			@cn.close if @cn
		end
end		

def getdata
			print "Enter your roll_no:"
			@roll_no=gets.to_i
			print"Enyer your name:"
			@name=gets
			print"Enter you marks:"
			@marks=gets.to_i

			stmt=@cn.prepare("insert into schoolinfo values (?,?,?)")
			stmt.execute(@roll_no,@name, @marks)
			puts"record insert successfully"

			puts"Do you want to add another record------->[y/n]"
			ans=gets.chomp

			if(ans=="y")

					getdata
			else
					disp		
		
			end	
end



def disp
			
			#to fetch data
			stm=@cn.query("select *from schoolinfo")
			

			puts "Roll no \tName \t Marks "

			while rs=stm.fetch_row do
					print " ",rs[0]
					print "      ",rs[1]
					print "  ",rs[2]

					puts
			end
end

end
School.new