class Block
	
	def blc
		puts"Block Starting"
		yield
		yield
		yield
		puts"Block Stoped :)"
	end
end
b=Block.new
b.blc{puts 'In the block'} 