class Test3
  def w
         soap_opera = ["all", "my", "children"]
           soap_opera.any? do |word|

             if  word[0] == "a"
             	puts "true"
             else
             	puts "false"
   end

       end
      end

      def s
      	lyric = ["laughter", "it's", "free"]
      	puts lyric[0]
      end

      def e
      	test_scores = [["jon", 99], ["sally", 65], ["bill", 85]]
      	test_scores.select do |name, score|

            score > 80
            
            
       end
      	end  
     end
 Test3.new.e