#file =File.open("sample.txt","r")
#contents = file.read
#puts contents

#contents = file.read
#puts contents

#or
 
 contents = File.open("sample.txt","r"){|file| file.read }
 puts contents