
require 'mysql'

begin
  con = Mysql.new('localhost','root','sai','axenic')
  rs = con.query('CREATE TABLE EMP
(LastName varchar(25) ,
FirstName varchar(25),
Address varchar(25),
City varchar(25))');
puts "table created"
  #rs.each_h {|hash| puts h['lastname','firstname','address','city']}
  con.close
end
                             
