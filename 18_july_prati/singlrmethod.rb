require 'singleton'
class Bar
  include Singleton
  attr_reader :jam
  
  def initialize
    @jam = 42
  end
  def double
    @jam *= 2
  end
end

b1 = Bar.instance
p b1.double
b2 = Bar.instance
p b2.double
p b1.jam