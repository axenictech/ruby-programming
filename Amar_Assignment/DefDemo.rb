class DefDemo
	
	def test(*arg)
		
		puts("Total parameters:#{arg.length}")
	
		print("Parameters are:")
		for i in 0...arg.length
			puts("#{arg[i]}")
		
		puts
		end
	end
end

	DefDemo.new.test(1,2,3,4,5)
	DefDemo.new.test("Java","Perl")
	DefDemo.new.test("Amar","Ashraf")
