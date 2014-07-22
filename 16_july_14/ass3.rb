
filef=File.new("read.txt","r")
while(output=filef.gets)
	puts (output)
end
filef.close

filef2=File.new("sample.pdf","r")
while(output=filef2.gets)
	puts (output)
end
filef2.close
