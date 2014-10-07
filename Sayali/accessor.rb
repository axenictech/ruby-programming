class Accessor
  def initialize(name, quantity)
    @name = name
    @quantity = quantity
  end
  
  def show
    puts @name
    puts @quantity
  end
end

Accessor.new("sugar",1).show
Accessor.new("cake",1).show

