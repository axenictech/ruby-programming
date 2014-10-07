class ARRAY
	def accept
		@no=[]
		puts "Enter 10 numbers:"
         for i in 0..10
         @no[i]=gets.to_i
          end


        puts "Display number:"
          for i in 0..10
           puts  @no[i]
          end
         
      end

  end
  ARRAY.new.accept


