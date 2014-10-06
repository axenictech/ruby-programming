/Example for Bubble Sort/

class Bubble_sort

	puts "Enter no. of elements in an Array :"
	elements = gets.to_i
	
	no=[] #Array to store elements
	for i in 1..elements
		puts"Enter #{i} no:"	
		no[i]=gets  #Elements stored in an Array
	end

	puts "Array before Sorting :"

	for i in 1..elements
		print no[i]
	end

	for i in 1..elements

		for j in 1..elements

			if no[i]<=no[j] #Swpping logic 
				temp=no[i]
				no[i]=no[j]
				no[j]=temp
			end	

		end

	end

	puts "elements after sorting:"

	for i in 1..elements
		print no[i]
	end
end