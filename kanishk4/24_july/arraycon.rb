class Array
	A=["x","y","z"]
	B=["a","b","c"]
    result=[]
    n=A.length.to_i
	i=0
	j=0
	loop do 
		
		result[i] =A[j]
		result[i+1]=B[j]
		break if j == n-1
		i=i+2
		j=j+1
	end	
	print result
	puts "\n"
end