
#program for accepting variable no of arguments in method
class DefDemo
	
	def test(*arg) # here we use * operator to accept Varargs parameter
		
		puts("Total parameters:#{arg.length}")
	
		print("Parameters are:")
		for i in 0...arg.length		# display tottal parameters
			puts("#{arg[i]}")
		
		puts
		end
	end
end

	DefDemo.new.test(1,2,3,4,5)  #calling method with diffrent no of parameters
	DefDemo.new.test("Java","Perl")
	DefDemo.new.test("Amar","Ashraf")
