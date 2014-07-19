def fibonac

	n=0
	previous_no=0
	next_no=1
	sum=0

	print previous_no
	print "\t"
	print next_no
	print "\t"

	while n<15

		sum =previous_no+next_no
		print sum
		print "\t"
		previous_no=next_no
		next_no=sum
		n+=1
	end
	print "\n"
end
fibonac