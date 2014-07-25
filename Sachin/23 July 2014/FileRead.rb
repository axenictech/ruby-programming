class FileData


	begin  
		#read the file which have been saved in driver 
  		File.open('read.txt', 'r') do |f1|  
    		while line = f1.gets  
      			puts line  
    		end  
  		end  
  	
		#write the file and create the file in driver
  		File.open('xyz.txt', 'w') do |f2|  
    	f2.puts "\nThank!"  
  	end  

  	#Exception Handling
	rescue Exception => msg  
  
  		puts msg  
	end  
end