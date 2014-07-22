require 'mysql'

begin
  con = Mysql.new('localhost','root','sai','axenic')
  rs = con.query('insert into table values
(padekar varchar(25) ,
tanvi varchar(25),
axenic varchar(25),
loni varchar(25))');
puts "record inserted"
  #rs.each_h {|hash| puts h['lastname','firstname','address','city']}
  con.close
end
                             
