class Article < ActiveRecord::Base
	validates :name, presence:true,
					 length:{minimum:5,maximum:20},
					 format:{with:/\A[a-zA-Z_"."-]+\Z/}
	validates :age, presence:true,
					numericality:{only_integer:true}

end
