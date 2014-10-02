require "mysql"
begin
	#mysql connection
	con=Mysql.connect("localhost","root","root","Data") 
	puts "connection suceesfully......"

	con.query("create table if not exists\ student(rollNo int primary key, stud_name varchar(60), marks int)")
	stamt=con.prepare("insert into student(rollNo,stud_name,marks) values (?,?,?)")

	#take input from cammand
	puts "Enter your roll no :"
	roll=gets.to_i

	puts "Enter your name :"
	name=gets

	puts "Enter your marks :"
	marks=gets.to_i

	stamt.execute(roll,name,marks)

	con.commit

	puts "\n"

	#fetch the data from table
	stamt=con.prepare("select * from student where rollNo=?")

	stamt.execute(roll)

	puts "Your data look like this :"
	puts "\n"

	while rs=stamt.fetch do

		puts "RollNo of student :=#{rs[0]}"

		puts "Name of student :=#{rs[1]}"
	
		puts "Marks obtained in exam :=#{rs[2]}"		
	end
	
	#if any Exception occure then execute e
	rescue Mysql::Error=>e
	puts "error :#{e}"
	#closed the database connection...
	ensure 
	con.close if con
end
