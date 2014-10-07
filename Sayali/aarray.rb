class Aarray
	def print
		a=[10,20,30]
		b=[10,30,40]
		c=[]
		puts "A:",a
		puts "B:",b
		 puts "Addtion:"
	  for i in 0..2
	  	c[i]=a[i]+b[i]
         
          puts c[i]
         end
         puts "subtration:"
        for i in 0..2
	  	c[i]=a[i]-b[i]
          
          puts c[i]
         end
         puts "Multiplication:"
          for i in 0..2
	  	c[i]=a[i]*b[i]
          
          puts c[i]
         end
        end
       end
       Aarray.new.print