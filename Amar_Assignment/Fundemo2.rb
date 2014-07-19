class Fundemo2

	
	def emp(a,n,s)
		@@age=a
		@@name=n
		@@sal=s
		
	end

	def show
		puts
		print("\t age:",@@age ,"\n\t name :",@@name,"\n\t Sal : ",@@sal)
		puts
	end
end

obj=Fundemo2.new
obj.emp(24,"Amar",35000)
obj.show
