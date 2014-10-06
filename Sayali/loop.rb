# loop each

class Loop
	def prinf
		a=[]
		puts "Enter 3 name:"
         for i in 0..2
         a[i]=gets.chomp
          end


        puts "Display :"
          a.each  do |arr| 
            puts "Name :#{arr}"
          end
      end

  end
 Loop.new.prinf
