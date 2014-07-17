
# program for simple use of method in class 
class Fundemo

	def emp(age,name,sal) # creating method emp
		@age=age
		@name=name
		@sal=sal
		puts
		print("\t age:",@age,"\n\t name :",@name,"\n\t Sal : ",@sal)
		puts
	end
end

obj=Fundemo.new   #creating object refrence.....
obj.emp(24,"Amar",35000)  #calling emp method using object refrence
