class Mstring < String
  def +@
    upcase
  end

  def -@
    downcase
  end


end

addme=Mstring.new

 def addme.~@

  puts "enter String."
 
  @no2=gets
  puts "the overload is"+"#{@no2}"
end

p ~addme
str = Mstring.new("This is prateema!")

p -str
p +str