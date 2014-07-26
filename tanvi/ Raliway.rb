require 'mysql'
def display
begin 
puts"enter your id"
id=gets.to_i
if(id=~/^[-0-9]+$/)
else
put"enter only digit"
end while(name!=~/^[-0-9]+$/)
puts "do you want to continue(Y/N)"
choice=gets
end while(choice=/^[y]+$/)
end

begin 
puts"enter your name"
name=gets
if(name=~/^[-a-z]+$/)
break
else
put"enter only char"
end while(name!=~/^[-a-z]+$/)
puts "do you want to con^[y]+$/)
end

begin 
puts"enter your source"
source=gets
if(source=~/^[-a-z]+$/)
break
else
put"enter only char"
end while(name!=~/^[-a-z]+$/)
puts "do you want to continue(Y/N)"
choice=gets
end while(choice=/^[y]+$/)
end

begin
puts"enter your destination"
destination=gets
if(destination=~/^[-a-z]+$/)
break
else
put"enter only char"
end while(name!=~/^[-a-z]+$/)
puts "do you want to continue(Y/N)"
choice=gets
end while(choice=/^[y]+$/)
end

begin 
puts"enter your payment"
payment=gets.to_i
if(payment=~/^[-0-9]+$/)
else
put"enter only digit"
end while(name!=~/^[-0-9]+$/)
puts "do you want to continue(Y/N)"
choice=gets
end while(choice=/^[y]+$/)
end

begin
  con = Mysql.new('localhost','root','sai','mydata')
   puts "connection establised"
  rs = con.query("select cost from payment2 where source=? and destination=?");
 rs.each do|a|
	puts a.row[2]   
     RETURN RESULT SET;
    rescue Exception => e
	    puts "Error in connection.....#{e}"
           con.close
 end



