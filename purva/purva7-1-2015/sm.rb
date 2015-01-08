puts "enter the 1st string"
s1 = gets
puts "enter the second string"
s2 = gets
s3=""
 x=0
while x < s1.length
 	s3 = s3 + s1[x]
 	s3 = s3 + s2[x]
 	x += 1
 end 
 puts "string is: #{s3}"