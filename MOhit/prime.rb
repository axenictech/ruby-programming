class Prime
  def prime
  	a=gets
    return false if a <= 1
    2.upto(Math.sqrt(a).to_i) do |x|
      return false if a%x == 0
    end
    true
  end
end
Prime.prime
