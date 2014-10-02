class ArrayAdd
	def show
		
	     p=["x","y","z"]
         q=["a","b","c"]
         r=[]

         for i in 0..2
            r[i]=p[i]+q[i]
           end
           puts r
    end
end
ArrayAdd.new.show