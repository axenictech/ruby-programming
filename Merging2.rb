class Merging

    a="xyz"
    b="abc"
   c=Array.new
    for i in 1..6
        boolenvariable = if i%2 == 0? true : false    
            if boolenvariable == true
                        for j in 0..2
                                c.push(a[j])
                        end
                else
                        for k in 0..2
                                c.push(b[k])
                        end     
                end 
        end
        print c
    end


 end    