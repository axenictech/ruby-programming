class Concat
	def cross
		a="abc"
		b="xyz"
    
     for i in 0..b.length-1 
      c=a[i]+b[i] 
     
      print "#{c}"
  		end
	end
end
s=Concat.new
s.cross