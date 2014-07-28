class AddArray

	#declare the array
	arr = [1,2,3,4,5,6,7,8,9,10] 


	#initilize variables
	sum1=0
	count = 0
	#count the lenght till end of array
	while count <= arr.length-1 do   
  		sum1 = sum1+ arr[count]   
  		count += 1   
   		#counter increase 
	end
	puts "Addition of 1..10 numbers #{sum1}"
end