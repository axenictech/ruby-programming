class Add
  
   attr_reader :x, :y 
   attr_accessor :z 
   
   def initialize(x,y,z)
    
   @x=x;
   @y=y;
   @z=z;

   end
  
end

add=Add.new(8,5,0)

puts "value of x= #{add.x}"
puts "value of y= #{add.y}"
add.z=add.x+add.y
puts"Addition of x and y is=#{add.z}"

