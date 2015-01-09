def fibo

no_1=0
no_2=1
no_3=0




puts "\n\n\n::::::::::::::::::::::::::::::Program Showing Fibonaci Series:::::::::::::::::::::::::::::::::::::::::::::\n\n"

print "Enter Your No For Elements You want in Fibonaci series  : "
n=gets().chomp().to_i

			print "Fibonaci series : "
			i=0
			while i<n 

			print "#{no_1} "

			no_3=no_1+no_2
			no_1=no_2
			no_2=no_3
			i+=1

			end


puts "\n\n\n::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n\n"
end
fibo
