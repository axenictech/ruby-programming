
printf "\n\n\n :::::::::::::::::::::::::::::::::::::::::::::Using 3.times do |i|::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n\n"
cars = nil
3.times do |i|
  cars = i+1
  puts "#{cars} Cars on road"
end
puts "#{cars + 1} getting ready"
printf "\n\n\n :::::::::::::::::::::::::::::::::::::::::::::Using while i<s.length::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n\n"
print "\n"
s="MAHESH_AXENIC";i=0
while i<s.length
printf "<%c>", s[i]; i+=1
end 
print "\n"

printf "\n\n\n :::::::::::::::::::::::::::::::::::::::::::::Using while i<s.length::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n\n"
s="MAHESH_AXENIC"
i=0
while i<s.length
	puts s[i]
	i+=1	
end
puts
printf "\n\n\n :::::::::::::::::::::::::::::::::::::::::::::Using each_byte::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n\n"
"abc".each_byte{|c| printf "<%c>", c}; print "\n"

# printf "\n\n\n Using for i in ::\n\n"
# for i in "abc"
#    print i
# end
printf "\n\n\n :::::::::::::::::::::::::::::::::::::::::::::Using for i in 0..4::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n\n"
c=0
for i in 0..4
   print i
   if i == 2 and c == 0
    c = 1
    print "\n"
    #retry
    end
end; print "\n"

printf "\n\n\n :::::::::::::::::::::::::::::::::::::::::::::Using while num > 0::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n\n"
def repeat(num)
      while num > 0
       yield #is used to call a block which is { puts "foo" }
       print "\nm\n"
         num -= 1
       end
     end
  repeat(3) { puts "foo" }


printf "\n\n\n :::::::::::::::::::::::::::::::::::::::::::::Using arr.each do |iterator|::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n\n"
  def iterators
	arr =[1,2,3,4,5]
	empty_array=[]
	arr.each do |iterator|
		 empty_array.push(iterator)
	end
	puts " New array : #{empty_array}"	
end
iterators

# printf "\n\n\n :::::::::::::::::::::::::::::::::::::::::::::Using def WHILE(cond)::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n\n"

# def WHILE(cond)
#        return if not cond
#        yield
#        #retry
# end
   
# i=0; WHILE(i<5) { print "#{i} \n"; i+=1 }
printf "\n\n\n :::::::::::::::::::::::::::::::::::::::::::::collect::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n\n"
a = [1,2,3,4,5]
b = a.collect{|x| 11*x}
b.each do |i| puts "#{i}" 
end
printf "\n\n\n :::::::::::::::::::::::::::::::::::::::::::::for var in Array::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n\n"

for  element  in b
	puts element
end
printf "\n\n\n :::::::::::::::::::::::::::::::::::::::::::::for var in Array::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n\n"
b.each do |element|
	puts element 
end
printf "\n\n\n :::::::::::::::::::::::::::::::::::::::::::::for var in Array with redo::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n\n"

for i in 0..5
   if i < 2 then
      puts "Value of local variable is #{i}"
      #redo does continue loop
   end
end
printf "\n\n\n :::::::::::::::::::::::::::::::::::::::::::::for row_num in 1..9::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n\n"
for row_num in 1..9
   line = ""
   for col_num in 1..9
      line += "#{row_num * col_num}\t"
   end
   
   puts "#{line}\n\n"
end
printf "\n\n\n :::::::::::::::::::::::::::::::::::::::::::::Each do::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n\n"

(1...9).each do |row_no|
	 line = ""
	(1...9).each { |col_no|	line+="#{row_no * col_no}\t"}
	
	print "#{line}\n"
end

#if we use do use end else use single line EACH
