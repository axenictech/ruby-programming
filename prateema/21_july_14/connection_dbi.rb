require 'dbi'

begin
     # connect to the MySQL server
     dbh = DBI.connect("DBI:Mysql:prateema:localhost", 
	                    "root", "root")
     # get server version string and display it
     puts "connected"
     dbh.disconnect if dbh
end