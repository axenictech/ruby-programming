	

	 begin
        
        @conn=Mysql.connect("localhost","root","root","prateema")
        @conn.query("CREATE TABLE IF NOT EXISTS person_det(id int primary key AUTO_INCREMENT,name varchar(20),address varchar(20),age int,password varchar(20),email varchar(20))")
        menu
    
      rescue Mysql::Error=>e 
        puts "Connection error"

      ensure
        @conn.close if @conn
      end