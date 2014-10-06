class PQR
	def accept
		p "Enter Name:"
		@name=gets.chomp
		p "Enter age"
		@age=gets.to_i
	end
	def print
		p "name:",@name
		p "age:",@age
	end
end

r=PQR.new
r.accept
r.print
