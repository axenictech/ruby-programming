#program for use of modules and method overloading in modules.......
	module A
		def m1
			puts("in m1...")
		end
	end

	module B
		def m1		#overriding m1 method module A.... 
			puts("in m2....")
		end
	end

	class Inhrit
		    include A   #including A & b
		    include B

	end

	Inhrit.new.m1();	
 
