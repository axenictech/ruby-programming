module ABC
	def disp
		puts "Hi"
	end
end
module PQR
	def disp
		puts "Hello"
	end
end
class Inhe
	include ABC
	include PQR
	def print
		puts "welcome"
	end
end

class Child < Inhe
	def show
		puts "haha"
	end
end

p=Inhe.new
p.print
p.disp
c=Child.new
c.show
c.print
c.disp