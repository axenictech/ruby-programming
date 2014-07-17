fileObj = File.new('MyTextFile.pdf', "r")
while (line = fileObj.gets)
  puts(line)
end
fileObj.close
