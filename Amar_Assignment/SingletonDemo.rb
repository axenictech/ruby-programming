#program for use of singleton method
class SingletonDemo

	def bullet
			puts"This is bullet...."
		end
end

obj=SingletonDemo.new.bullet
print obj

def obj.honda
	puts"This is honda..."
end

obj.honda