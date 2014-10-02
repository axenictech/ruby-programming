class Ccp
 def chomp
	puts "Enter Your Name:"
	name=gets.chomp
	puts "Hello"+name+":p"
 end
 def chop
	puts "Enter Your Name :"
	n = gets
	puts n.chop
 end
end
c=Ccp.new
c.chomp
c.chop