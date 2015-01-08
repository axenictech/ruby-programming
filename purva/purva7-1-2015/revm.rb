class Revers
  puts "enter the no"
  no=gets.to_i
  rem = 0 
  rev = 0 
  while (no!=0) do
	  rem = no% 10
    rev += rem
    rev *= 10
    no /= 10
  end     
    puts "reverse no is:#{rev}"
end
