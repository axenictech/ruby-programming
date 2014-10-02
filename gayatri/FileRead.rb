fileobj=File.new('FileRead.txt',"r") 
  while (a=fileobj.gets)   
  	puts a 
  end
  fileobj.close 
  