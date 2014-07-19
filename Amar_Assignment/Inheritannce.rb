
	module A
		def m1
			puts("in m1...")
		end
	end

	module B
		def m1
			puts("in m2....")
		end
	end

	class Inhrit
		    include A
		    include B

	end

	Inhrit.new.m1();	
 
