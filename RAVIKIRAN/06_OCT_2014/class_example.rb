class Customer
	@@no_of_cust=0
	def initialize(id,name,salary)
		@id=id
		@name=name
		@salary=salary
	end

	def display
		puts "Customer id = #{@id}"
		puts "Customer name = #{@name}"
		puts "Customer salary = #{@salary}"
	end

	def total_cust
		@@no_of_cust+=1
		puts "Number of customer : #{@@no_of_cust}"
	end
end

cust1=Customer.new(1,"Ravikiran",10000)
cust2=Customer.new(2,"Rahul",7000)

cust1.display()
cust1.total_cust()

cust2.display()
cust2.total_cust()
