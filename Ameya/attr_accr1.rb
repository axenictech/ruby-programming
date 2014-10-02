/attribute accesssor reader method/

class BookInStock

	attr_reader :isbn, :price

	def initialize(isbn,price)
		@isbn=isbn
		@price=Float(price)
	end

	#..
end

book=BookInStock.new("isbn",12.34)
puts "ISBN : #{book.isbn}"
puts "PRICE : #{book.price}"