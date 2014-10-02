require "mysql"

class School

def initilize

		begin
				#creating connection to mysql
				cn=Mysql.connect("localhost","root","root","kanishk")
				puts"connection sucessfully"
				#creation of table
				cn.query("create table if not exists\ schoolinfo(roll_no int,name char(20),marks int)")
				#insertion in table
				getdata
				#inpute statements
		rescue Mysql::Error=>e
				puts "Error in Connection-.....#{e}"

				#ensure is used to excute what you want to excute compulsary
	    ensure

			cn.close if cn
		end
end		

def getdata
			puts "Enter your roll_no"
			@roll_no=gets.to_i
			puts"Enyer your name"
			@name=gets
			puts"Enter you marks"
			@marks=gets.to_i

			stmt=cn.prepare("insert into schoolinfo values (?,?,?)")
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
			cn.commit
			puts"record update successfully"
			puts"\n"
			#to fetch data
			stm=cn.prepare("select *from schoolinfo where roll_no=?")
			stm.execute(roll_no)
			puts"Your data"
			puts"\n"
			while rs=stm.fetch do
					puts "roll_no :#{rs[0]}"
					puts "name    :#{rs[1]}"
					puts "marks   :#{rs[2]}"
					puts"record update succesfully"
			end
end

end
School.new