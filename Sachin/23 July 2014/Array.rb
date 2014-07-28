class Array
	#declare of two array

	s1=["x","y","z"]
	s2=["a","b","c"]

	result=[]

	#count the length of s1 
	n=s1.length.to_i
	i=0
	j=0
	loop do 
		
		result[i] =s1[j]
		result[i+1]=s2[j]

		break if j == n-1
		#increase count till j==n-1
		i=i+2
		j=j+1
	end	
	print result
	puts "\n"
end