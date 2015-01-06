def iterators
	arr =[1,2,3,4,5]
	empty_array=[]
	arr.each do |iterator|
		 empty_array.push(iterator)
	end
	puts " New array : #{empty_array}"	
end
iterators
