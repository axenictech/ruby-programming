class Sample2
 
	attr_reader :name, :address
	attr_accessor :age;
	

 	def initialize(name1,address1,age1)
	
	@name=name1
	@address=address1
	@age=age1	
	end
	
end

sam=Sample2.new("ABC","ABCDEFGHI",22)
puts "Employee Name = #{sam.name}"
puts "Employee Address = #{sam.address}"
puts "Employee Age = #{sam.age}"
sam.age=sam.age+5;
puts "Employee's age after 5 years=#{sam.age}"
