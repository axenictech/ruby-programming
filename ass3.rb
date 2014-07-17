
filef=File.new("read.txt","r")
while(output=filef.gets)
	puts (output)
end
filef.close
