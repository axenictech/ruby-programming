#progrm for sorting the no
class Sorting
	
	puts"Enter no of element:" #get the no of elemment from user
	element=gets.to_i
	
	no=[] #Initilize array to store elements
	for i in 1..element
			puts"Enter #{i} no:"	
			no[i]=gets  #store elements in array
	end




	puts "elements before sorting:"

		for i in 1..element
			print no[i]

		end

	
		for i in 1..element

			for j in 1..element

				if no[i]<=no[j] #check if 1st elements with 2nd no then 2nd no is swapped 

					temp=no[i]
					no[i]=no[j]
					no[j]=temp
				end	

			end

		end

			puts "elements after sorting:"

				
		for i in 1..element #print array after swap
			print no[i]

		end

end
				
