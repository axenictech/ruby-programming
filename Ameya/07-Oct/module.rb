module Mom
   def m1
   		puts "property no1 from Mom"
   end
   def m2
   	   puts "property no2 from Mom"
   end
end

module Dad
   def d1
   	puts "property no1 from Dad"
   end
   def d2
   	puts "property no2 from Dad"
   end
end

class Child
include Mom
include Dad
   def s1
   	puts "We are family"
   end
end

samp=Child.new
samp.m1
samp.m2
samp.d1
samp.d2
samp.s1