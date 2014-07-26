class BubbleSort

	def bubbleSort(list)
  
    for i in 0..(list.length - 2)
    	for j in 0..i-1
    		for k in 0..(list.length - 2)-j-1
      		if list[k] > list[k + 1]
      			temp=list[k]
      			list[k]=list[k+1]
      			list[k+1]=temp
      		end
      	end
  	end
  	return list
  end
end



list=[9,8,7,6,5,4,3,2]
b=BubbleSort.new

b.bubbleSort(list)