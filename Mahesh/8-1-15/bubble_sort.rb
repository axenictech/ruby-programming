def bubble_sort

#logic
# 	for i = 1:n,
#     swapped = false
#     for j = n:i+1, 
#         if a[j] < a[j-1], 
#             swap a[j,j-1]
#             swapped = true
#     → invariant: a[1..i] in final position
#     break if not swapped
# end


	array=[]
	puts "\n\n\n::::::::::::::::::::::::::::::Program Showing Bubble_Sort:::::::::::::::::::::::::::::::::::::::::::::\n\n"
		
		puts "Enter Your Array Elements for Bubble Sort  [Press * to stop your Input]"
		loop do
			element = gets.chomp
				  	if (element == '*')
			 	  	break
			 			else
						array << element.to_i
					 end		
		end

		print "Initial : #{array} \n"

		n=array.length-1
		for i in 0..n
			print "i:#{i}---- "
			swapped = false
			for j in n.downto(i+1) 
				if ( array[j] < array[j-1] )
					array[j],array[j-1] = array[j-1],array[j]  #logic for swap
					swapped = true
				print "j:#{j}----#{array}\n "				
				end
					# p "j..............#{j}"
					
			end
			break  if(swapped == false) 
			print "#{array} \n"


			# i+=1
		end
	print "Final : #{array} \n"
end
bubble_sort


