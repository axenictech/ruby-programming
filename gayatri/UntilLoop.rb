class Until
	def uloop
		$i = 0
		$num = 5
		begin
	  	 puts("Inside the loop i = #$i" )
   			$i +=1;
		end until $i > $num
	end
end
c=Until.new
c.uloop