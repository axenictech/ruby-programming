class Sort


	puts "Enter no of elements"
	no=gets.to_i
	puts "Enter your elements"
	a=[]
	for i in 0..no-1

		a[i]=gets
	end

	puts "Before sorting"
	puts a
	puts "\n"

	size=a.length
	for i in 0..size-1

		for j in 0..size-1

			if a[i].to_i<a[j].to_i

				temp=a[i]
				a[i]=a[j]
				a[j]=temp

			end
		end
	end
		puts "After sorting"
		puts a
		puts "\n"
end
