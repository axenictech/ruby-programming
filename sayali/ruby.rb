
require 'mysql'
begin
con = Mysql.new('localhost', 'root', '123', 'ruby')
rs = con.query('select * from student_ruby') 
rs.each_hash { |h| puts h['name']}
con.close  
end
