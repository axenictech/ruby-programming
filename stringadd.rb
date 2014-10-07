class Stringadd
	def print
		a="xyz"
		b="pqr"
		c=""
		

         for i in 0..2
         	c+=a[i]+b[i]
         end
         puts "#{c}"
		

		
	end
end
Stringadd.new.print