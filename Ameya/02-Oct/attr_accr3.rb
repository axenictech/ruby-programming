/writable attributes/

class BookInStock
	attr_reader :isbn, :price

	def initialize(isbn, price)
		@isbn = isbn
		@price = Float(price)
	end

	def price=(new_price)
		@price = new_price
	end

# ...
end

book=BookInStock.new("isbn1",33.80)
puts "ISBN : #{book.isbn}"
puts "PRICE : #{book.price}"
book.price=book.price * 0.75
puts "NEW PRICE : #{book.price}"