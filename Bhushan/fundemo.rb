class Fundemo

	def emp(age,name,sal)
		@age=age
		@name=name
		@sal=sal
		puts
		print("\t age:",@age,"\n\t name :",@name,"\n\t Sal : ",@sal)
		puts
	end
end

obj=Fundemo.new
obj.emp(24,"Amar",35000)
