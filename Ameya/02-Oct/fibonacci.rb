$a=0
$b=1
$i=0

puts "Enter till which no. u want print Fibonacci series : "
$no=gets.to_i

puts "Fibonacci Series is :"

while $i<$no do 
  $c=$a+$b
  $a=$b
  $b=$c
  puts "#{$c}"
  $i=$i+1
end