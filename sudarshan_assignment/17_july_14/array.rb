class Merge

	str1=["x","y","z"]
	str2=["a","b","c"]

	str=[]

	n=str1.length.to_i
	i=0
	j=0
	loop do 
		
		str[i] =str1[j]
		str[i+1]=str2[j]

		break if j == n-1
		i=i+2
		j=j+1
	end	
	print str
	puts "\n"
end
