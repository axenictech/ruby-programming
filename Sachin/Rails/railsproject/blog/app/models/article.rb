class Article < ActiveRecord::Base
	has_many :comments
	 validates :title, presence: true,
                    length: { minimum: 5, maximum: 10}
      validates_presence_of :title, :text
  	validates_uniqueness_of :title, :text

  	
end
