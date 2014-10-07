class ArrayManu
	def show
		begin
	     num=[]
       puts "Enter 5 numbers:"

       for i in 1..5
         num[i]=gets.to_i 
        end
        puts "Number Before sort:"
         for i in 1..5
           p num[i]
        end

puts "1:Ascending"
puts "2:Descending"
puts "Enter choice:"
    @c=gets.to_i

case @c

	when 1
      for a in 1..5
      	for b in 1..5
      	  if num [a] < num [b]
      		temp=num[a]
      		num[a]=num[b]
      		num[b]=temp
      	   end
     	 end
  		end
 when 2
      for a in 1..5
      	for b in 1..5
      	  if num [a] > num [b]
      		temp=num[a]
      		num[a]=num[b]
      		num[b]=temp
      	  end
       end
    end
else 
	puts "Enter valid choice"
end
  puts "After sort:"

       for i in 1..5
         p num[i]
        end

     puts "Do you want to coontinue[y/n]"
        
       
       @n=gets.chomp
end  until @n=="n"

end
end
ArrayManu.new.show
