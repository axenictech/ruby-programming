aFile = File.new("test.rb", "r+")
if aFile
   aFile.syswrite("ABCDEF")
   puts "Content inserted successfully"
else
   puts "Unable to open file!"
end