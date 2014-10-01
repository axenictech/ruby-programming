class UseAccesors
	def input(a,b)
		@a = a
		@b = b
	end
	def showResult
		puts @a
		puts @b
	end

end
c=UseAccesors.new
c.input("Gayatri","Yeole")
c.showResult
