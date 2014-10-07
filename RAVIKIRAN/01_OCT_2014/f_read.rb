aFile = File.new("fibo.rb", "r")
puts "THE CONTENT OF ACC.RB FILE"
if aFile
   content = aFile.sysread(100)
   puts content
else
   puts "Unable to open file!"
end