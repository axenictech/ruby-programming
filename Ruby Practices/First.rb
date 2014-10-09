#file: Second.rb 
 require "pg"
require 'yaml'

class Customer
	@id
	@password
	@name
	@address
	def initialize()
	end

	def setAll(id,name, address,password)
		@id=id
		@name=name
		@address=address
		@password=password
	end
	def setName(name)
        @name=name
	end
	def getName()
        return @name
	end
	def setId(id)
        @id=id
	end
	def getId()
        return @id
	end

	def setAddress(address)
        @address=address
	end
	def getAddress()
        return @address
	end

	def setPassword(password)
        @password=password
	end
	def getPassword()
        return @password
	end


	def self.NewCustomer()

	customer =Customer.new
	p "Enter Username"
	customer.setId(gets.chomp)
	p "Enter Your Name"
	customer.setName(gets.chomp)
	p "Enter Your Address"
	customer.setAddress(gets.chomp)
	p "Enter Password"
	customer.setPassword(gets.chomp)
	return customer
	end

end


class Product
	@id
	@name
	@price
	@stock
	def initialize()
	end

	def setAll(id,name, price, stock)
		@id=id
		@name=name
		@price=price
		@stock=stock
	end
	def setName(name)
        @name=name
	end
	def getName()
        return @name
	end
	def setPrice(price)
        @price=price
	end
	def getPrice()
        return @price
	end
	def setStock(stock)
        @stock=stock
	end
	def getStock()
        return @stock
	end

	def self.NewProduct()

	product =Product.new
	p "Enter Product Name"
	product.setName(gets.chomp)
	p "Enter Your Price"
	product.setPrice(gets.chomp)
	p "Enter Stock"
	product.setStock(gets.chomp)
	return product
	end
end


class Cart

    @cart
	def initialize()
	@cart = Hash.new{}
	end

	def addItem(id,quantity)
	
		if @cart.has_key?(id)
			@cart[id]=@cart[id].to_i+quantity.to_i
		else
			@cart[id]=quantity
		end
	end
	def getItem(id)
      return @cart[id]
	end

	def removeItem(id)
      @cart.delete(id)
	end

	def removeItem(id)
      @cart.delete(id)
	end
	def totalPrice()
		total=0.to_i
		@cart.each do |key, array|
  		
		end
	end

end

class Login
@customerId
@password
	def initialize()
	@customerId=""
	@passord=""
	end

	def setCredentials(customer,passord)
	@customerId=customer
	@passord=passord
	end

end


class SaveLogin
	def save(credentials)
	
	end
end


class Service

@connection

	def initialize()
		begin
			@connection=PGconn.connect( "localhost",5432,'','',"newdb", "jay","jay")
		rescue Exception => e
			puts "Error in connection.....#{e}"
		end
	end

	def getCustomerPassword(id)
		begin
		    res  = @connection.exec("select * from Customer where id='"+id.to_s+"'")
			return res[0]["password"]
			rescue Exception => e
		end
	end

	def getProduct(id)
		res  = @connection.exec("select * from product where name='"+id+"'")
		return Product.new
	end

	def saveCustomer(customer)
		res  = @connection.exec("insert into Customer values('"+customer.getId()+"','"+customer.getName()+"','"+customer.getAddress()+"','"+customer.getPassword()+"')")
	end
	def saveProduct(product)
		res  = @connection.exec("insert into Product values('"+product.getName()+"',"+product.getPrice()+","+product.getStock()+")")
	end
	def updateProduct(name,stock)
		res  = @connection.exec("update Product set stock="+stock+" where name='"+name+"'")
	end

	def listAllProducts()
		res  = @connection.exec("select * from Product")
	puts	"Product Name           Price             Stock" 
		res.each do |row|
			puts row['name']	+"                     "+row['price']+"              "+row['stock']
		end
	end

end


class Run

	def start

		p "For login -1"
		p "For Registration 2"
		choice=gets.to_i
		if(choice==1)
			begin
			p "Enter Username"
			username=gets.chomp
			p "enter Password"
			password=gets.chomp
			service=Service.new
			passwordfromdatabase=service.getCustomerPassword(username)
		if(passwordfromdatabase.eql?(password))
			service.listAllProducts()
		else
		puts "\nWrong Password\n\n"
		start
		end

	rescue Exception => e
		start
	end
	else
		Service.new.saveCustomer(Customer.NewCustomer());
		start		
	end
end
end


r=Run.new
r.start
