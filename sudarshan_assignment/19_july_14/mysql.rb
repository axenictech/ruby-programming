#connection with mysql 

#mysql is module
require "mysql"

# use exception handling block
begin

# cn is object of mysql and using connect pass all value to class
	cn=Mysql.connect("localhost","root","mysql","Testdb")
	puts "connection successfully"

#to create table 
	cn.query("create table if not exists\ axenic(id int, name char(20), salary int)")
	
#to insert value into table use prepare statement
	stmt=cn.prepare("insert into axenic(id,name,salary) values(?,?,?)")

#take input from command
	puts "Enter your ID"
	id=gets.to_i
	puts "Enter your Name"
	name=gets
	puts "Enter your salary"
	salary=gets.to_i

#input fetch into statement excute
	stmt.execute(id,name,salary)
#do commit 
	cn.commit
	
	puts "Record update successfully"

	puts "\n"
#to fetch data from mysql value into ruby using prepare statement
	stm=cn.prepare("select * from axenic where id=?")
	stm.execute(id)

	puts "Your Data"
	puts "\n"

	while rs=stm.fetch do
	puts "Id: #{rs[0]}"
	puts "Name: #{rs[1]}"
	puts "salary: #{rs[2]}"
	end
#use rescue to handle exception and Mysql::Error is default provided by mysql module
rescue Mysql::Error=>e
	puts "Error in Connection-.....#{e}"

#ensure is used to excute what you want to excute compulsary
ensure

	cn.close if cn
end