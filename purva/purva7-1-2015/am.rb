s1=["a","b","c"]
s2=["x","y","z"]
s3=""
 x=0
 while x < s1.length
 	s3 = s3 + s1[x]
 	s3 = s3 + s2[x]
 	x+=1
 end
 puts " output of string is #{s3}"