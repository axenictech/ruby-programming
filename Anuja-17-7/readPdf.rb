fileobj=File.new('/home/anuja/mywork-16-7/Bhushan.pdf',"r") 
  while (a=fileobj.gets)   #get file info line by line
  	puts a #then print it on console
  end
  fileobj.close #then close the file
  