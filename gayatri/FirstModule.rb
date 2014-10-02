module A
   def a1
   		puts "Hello"
   end
   def a2
   	   puts "From Module A"
   end
end
module B
   def b1
   	puts "Now"
   end
   def b2
   	puts "From Module B"
   end
end

class Sample
include A
include B
   def s1
   	puts "Greetings From Module A and Module B"
   end
end

samp=Sample.new
samp.a1
samp.a2
samp.b1
samp.b2
samp.s1
