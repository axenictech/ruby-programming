class Index
	def show
        puts "1.Add"
		puts "2.Delete"
		puts "3.Exit"
   puts "Enter your choice:"
   	ch=gets.to_i
   case ch
   when 1
   	    a=[]
   	    begin
   	   puts "Enter position:"
   	   pos=gets.to_i
       
       puts "Enter Value:"
       val=gets.to_i
         for i in 0..a.length-1
             a[i]=val
             puts a
          end
         puts "Do you want to continue[y/n]?"
         @n=gets.chomp
       end until 
          @n == "n"

    when 2
    	puts "Enter position"
   	   pos=gets.to_i
   	  puts "Enter Value:"
       val=gets.to_i
       
    when 3
    	puts "h"
   
else
	"Enter Valid choice"
	 end
   	end
   end
   Index.new.show