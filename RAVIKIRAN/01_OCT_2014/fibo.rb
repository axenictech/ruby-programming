$a=0
$b=1
$i=0
puts "#{$a}"
puts "#{$b}"
while $i<10 do
	$c=$a+$b
	$a=$b
	$b=$c
	puts "#{$c}"
	$i=$i+1
end