#program for use of singletone method
class Singleton

	def singleton(side)
			return side*side

	end
end

obj=Singleton.new.singleton(5.5)

puts "Area of Square",obj

ob= Singleton.new
def ob.area(side) #creating singletone method
	p "hell"
end

p  	ob.area(5) #call singletone method