class Fibbo

	#manual input
	puts "Enter the number :"
	n=gets.to_i

	if n==1 || n==2
		puts 0
		puts 1
		elsif n==0
			puts 0

		else
		fibbo=0
		prev=1
		next1=1
		puts fibbo
		puts prev
		puts next1
		#actual logic of program Fibbonacci
		for i in 3..n

			fibbo=prev+next1
			puts fibbo
			prev=next1
			next1=fibbo
		end
	end
end