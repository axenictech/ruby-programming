class DuckTyping
  def a1
    puts "Hello!"
  end
  
  def a2
    puts "In first Class"
  end
end

class Person
  def a1
    puts "Hi"
  end
  
  def a2
    puts "In Second Class"
  end
end

def in_the_forest(b)
  b.a1
  b.a2
end

def game
 
  j= Person.new
  j= DuckTyping.new
  in_the_forest j
  
end

game