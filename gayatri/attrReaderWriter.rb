class Attrrw
  def initialize(name, age)
    self.name = name
    @age = age
  end

  attr_reader :name, :age

  def name=(new_name)
    if new_name =~ /^[A-Z][a-z]+ [A-Z][a-z]+$/
      @name = new_name
    else
      puts "'#{new_name}' is not a valid name!"
    end
  end

  def msg
    puts "Have Smile #{@name}!"
    @age += 1
  end

  def info
    puts "You are #{@name}, age #{@age}"
  end
end

p = Attrrw.new("Swati Ketkar", 23)
p.info
p.name = gets
p.name = "a"
p.msg


