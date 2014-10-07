class Filerw
	def print
        
		aa=File.open("a.txt", "r") 
		while (a=aa.gets)
			puts a
   end
end
		
	end
Filerw.new.print