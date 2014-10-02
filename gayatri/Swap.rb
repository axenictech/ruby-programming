class Swap
	def swap()
	array = [4, 5, 6, 7]

	array[0], array[3] = array[3], array[0]
	puts array
	end
end
c=Swap.new
c.swap
