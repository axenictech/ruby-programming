class Collect

	def c

		a = [1,2,3,4,5]
		b = a.collect{|x| 10*x}
		puts b
	end
end

i=Collect.new
i.c