class Single

class << self
    def singleme
      to_s
    end
  end
end
Single.define_singleton_method(:who_am_i) do
  p "I am: #{singleme}"
end
Single.who_am_i 
guy = "Bob"
guy.define_singleton_method(:hello) { "#{self}: Hello there!" }


class SingleMethod
	class <<self
		def printme
		p 
		end
	end
end
SingleMethod.define_singleton_method(:who_am_i) do
	p "i am: #{}"
