require 'mysql'

class Project
	begin
		con=Mysql.connect('localhost','root','root','MyDB')	
	puts "\n!!!!!!!!!!!!!!!!!!!----------Flight Booking System---------!!!!!!!!!!!!!!!!!!!!!\n\n"
	puts "1. Booking\t 2. Cancel Booking\t 3. Exit\n\n"
	print "Please enter your choice :"
	choice=gets.to_i
	source=""
	destination=""

begin 
puts"enter your id"
id=gets.to_i
if(id=~/^[-0-9]+$/)
break
else
puts "enter only digit"
end while(name!=~/^[-0-9]+$/)
puts "do you want to continue(Y/N)"
choice=gets
end while(choice= /^[y]+$/)

	res=con.prepare('select cost from payment3 where source=?,destination=?')
	res=stm2.execute(source,destination)
	row=stmt2.fetch
	cost=row[0]

while row=res.fetch do
	payment3=row[0]
end

begin 
puts"enter your name"
name=gets
if(name= ~/^[-a-z]+$/)
break
else
put  "enter only char"
end
while(name!= ~/^[-a-z]+$/)
puts "do u want to continue(Y/S)"
choice=gets
end
while(choice=/^[y]+$/)
end 

begin 
puts"enter your source"
source=gets
if(source= ~/^[-a-z]+$/)
break
else
puts "enter only char"
end while(name!= ~/^[-a-z]+$/)
puts "do u want to continue(Y/S)"
choice=gets
end while(choice=/^[y]+$/)
end

begin
puts "enter your destination"
destination=gets
if(destination= ~/^[-a-z]+$/)
break
else
put"enter only char"
end while(name!= ~/^[-a-z]+$/)
puts "do u want to continue(Y/S)"
choice=gets
end while(choice=/^[y]+$/)
end

begin 
puts"enter your cost"
cost=gets.to_i
if(cost= ~/^[-0-9]+$/)
break
else
put"enter only digit"
end while(name!= ~/^[-0-9]+$/)
puts "do u want to continue(Y/N)"
choice=gets
end while(choice=/^[y]+$/)
end

