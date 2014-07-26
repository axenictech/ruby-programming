class People
	def say
		puts "hi"
	end
end

baby=People.new
man=People.new

def baby.say
		puts "hey hey hey"
end

baby.say
man.say