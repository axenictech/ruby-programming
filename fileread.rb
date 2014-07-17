fileobj=File.new('anu.txt',"r") 
  while (a=fileobj.gets)   #get file info line by line
  	puts a #then print it on console
  end
  fileobj.close #then close the file
  
    
