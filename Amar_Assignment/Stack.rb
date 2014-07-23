class Stack

		stack=Array.new(5)
		top=0
		len=stack.length

		def push
				if (stack.length<=5)
				 	puts"Enter no to push:"
				 	no=gets
				 	stack[top]=no
				 	top+=1
				else
					puts"Stack overflow............"
				end	

		end

		def pop
				if (top==0)
					puts"stack overflow............."
				else	
					puts"No #{no} has been poped......."
					top-=1
				end	


		end	

		def disp
				for i in stack.top
					puts(stack.top[i])
				end

		end

		
end
		begin 
				puts"1.push"
				puts"2.pop"
				puts"3.Display"
				puts"4.exit"
				puts"Enter your choice:"
				ch=gets
				case ch

				when ch==1
						Stack.new.push()
				when ch==2
						Stack.new.pop()
				when ch==3
						Stack.new.disp()
				when ch==4
					 	break
				else
					puts"You Enterd wrong choice......"
				end	 	
				print("Do you Want to Continue.....[Y/N]----->")
        		@option=gets		
									
									
		end while(@option=~/^[y]+$/)
