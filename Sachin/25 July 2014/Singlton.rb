class SingletonMethod

	#normal method
	def abc

		puts "aaaaaa"
	end
end

#Object abc1 created
abc1=SingletonMethod.new
#Object abc2 created
abc2=SingletonMethod.new

#singleton Method
def abc1.abc

		puts "bbbbbb"
end

abc1.abc
abc2.abc