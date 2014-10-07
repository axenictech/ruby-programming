
	def fact(n)
  if n == 0
    1
  else
    n * fact(n-1)
  end
end
puts "Enter Number:"
 num=gets.to_i
puts fact(num)

