class MagicString < String
  def +@
    upcase
  end

  def -@
    downcase
  end

  def !
    swapcase
  end

  def ~
    
    tr 'A-Za-z', 'N-ZA-Mn-za-m'
  end
end

str = MagicString.new("This is my string!")
p +str         # => "THIS IS MY STRING!"
p !str         # => "tHIS IS MY STRING!"
p (not str)    # => "tHIS IS MY STRING!"
p ~str         # => "Guvf vf zl fgevat!"
p +~str        # => "GUVF VF ZL FGEVAT!"
p !(~str)      # => "gUVF VF ZL FGEVAT!"