class StaticDemo

	AGE=10
	NAME="Amar"
	SAL=35000
	def emp(a,n,s)
		#AGE=a
		#NAME=n
		#SAL=s
		
	end

	def show
		#AGE=AGE+20
		puts
		print("\t age:",AGE ,"\n\t name :",NAME,"\n\t Sal : ",SAL)
		puts
	end
end

obj=StaticDemo.new
obj.emp(24,"Amar",35000)
obj.show
