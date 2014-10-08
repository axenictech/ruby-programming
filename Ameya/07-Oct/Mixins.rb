module Stuff  
  C = 10  
  
  def Stuff.m(x)  
    C*x  
  end

  def p(x)  
    C + x  
  end

  class T  
    @t = 2  
  end  
end
  
puts Stuff::C  
puts Stuff.m(3)  
x = Stuff::T.new 