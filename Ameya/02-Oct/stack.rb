class Array1

	stack=Array.new(7)
	top=0
	len=stack.length

	def push
		if (stack.length<=7)
			puts "How many nos. u want to insert : "
			no=gets.chomp
			stack[top]=no
			top+1
		else
			puts "Stack Overflow"
		end
	end

	def pop
		if (stack.length=0)
			puts "Stack is Empty"
		else
			puts "The element #{no} removed from Stack"
			top-1
		end
	end

	def disp

	end
end

case ch

	if ch==1 

	elsif ch==2

	else

	end

end
