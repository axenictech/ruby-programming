class StringM
	def print
        puts "1.Enter Uppercase String:"
         @s=gets.downcase
        puts "Lowercase String is: #{@s}" 

        puts "2.Enter Lowercase String:"
         @s=gets.upcase
		puts "Uppercase string is: #{@s}"

		 puts "3.Enter string:"
		@s=gets.reverse
		puts "Reverse String  is: #{@s}"

		puts "4.Enter string:"
		@s=gets.chop
		puts "using chop method String is: #{@s}"

        puts "5.Enter string:"
		@s=gets.strip
		puts "strip String is: #{@s}"

		puts "6.a-Enter string 1:"
		@s1=gets
		puts "b-Enter string 2:"
		@s2=gets.count(@s1)
		puts "Count is: #{@s2}"

		puts "7.a-Enter string 1:"
		@s1=gets.chop
		puts "b-Enter string 2:"
		@s2=gets.concat(@s1)
		puts "Count is: #{@s2}"

        puts "8.Enter string:"
		@s=gets.hex
		puts "String  is: #{@s}"

		puts "9.Enter string:"
		@s=gets.hash
		puts "Hash based length of String is: #{@s}"

         puts "10.Enter string:"
		@s1=gets.chomp
		@s1=@s1.length
		
		puts "Length of String  is: #{@s1}" 
	end

end
StringM.new.print