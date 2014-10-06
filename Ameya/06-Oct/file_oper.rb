class File_Oper

	def file_read
		File.open('FileIO.txt', 'r') do |f1|  
  		while line = f1.gets  
    		puts line  
		end
	end

	def file_write
		File.open('FileIO.txt', 'w') do |f2|  
  		# use "\n" for two lines of text  
  		f2.puts "Created by Ameya\nThank U!"
  	end
  	end
end

begin 
	puts "1. File Read"
	puts "2. File Write"
	puts "3. Exit"
	puts "Enter your choice : "
	ch=gets.to_i
	
	case ch

	when 1
		File_Oper.new.file_read()

	when 2
		File_Oper.new.file_write()

	when 3
	 	break
	else
		puts"You Enterd wrong choice..."
	end	 	

	print("Do you Want to Continue[Y/N] : ")
	@option=gets.chomp		#to eliminate '\n' characters
	
	end while(@option.eql?"Y")
end