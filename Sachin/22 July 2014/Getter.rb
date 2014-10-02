
class Sample
 
	attr_reader :name, :address
	

 	def initialize(name1,address1)
	
	@name=name1
	@address=address1

	end

end
sam=Sample.new("ABC","ABCDEFGHI")
puts "Employee Name = #{sam.name}"
puts "Employee Address = #{sam.address}"
