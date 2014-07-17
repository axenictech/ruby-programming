myfile = File.new("input.txt", "a+")
if myfile
   content = myfile.sysread
   puts content
else
   puts "Error  open file!"
end
