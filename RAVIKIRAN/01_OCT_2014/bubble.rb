array=Array[5,4,3,2,1]
puts "Unsorted lis : #{array}"
i = 0 
      swapped = true
      lenght = array.length-1
      while swapped do
          swapped = false
          while i <lenght
              n = i +1
              if array[i] > array[n]
              dummy = array[i]
              array[i]= array[n]
              array[n] = dummy  
              swapped = true

              end
             i+=1
          end

      end
puts "Sorted array is : #{array}"