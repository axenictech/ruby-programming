class Test2
	def s
		puts "",[:a, :b, :c].include?(:x)
		
	end

	def m
		puts [2, 4, 6, 8].map{ |number| number **2}
		

	end
    def b
    	puts :id.instance_of?(Symbol)
    end
    def s
    	sports=["s","d","c"]
    	sports.each_with_index do |cat, shirt|

           puts shirt.to_s + ". " + cat
    end
     
end
     def e
     	last_names = ["D", "Krugman"]
         last_names.map do |last_name|

         puts "Paul " + last_name
   end
 end
end
Test2.new.e