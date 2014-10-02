#use salt password hashing concept
#using pcks5, securerandom and base64 concept encode password with salt and 
#join salt and encrypted password and join string stored in database as password
#at login time retrive join string password then splite join string
#after that decrypt encrypted password 
#take salt from join string and mix with current login password
#match mixing current password and decrypt mixing password

#use highline/import module to hide password on prompot
require "highline/import"
#use securerandom module for salt value
require "securerandom"
#use to do mixing of password and salt
require "openssl"
#use to encode mixing value
require "base64"
#to coonect with mysql database
require "mysql"

class Login

	def initialize
		begin
	#connection to mysql
			@connection=Mysql.connect("localhost","root","mysql","Testdb")
			puts "\n\tRegister here.....!!!"
			print "\n\tEnter your Email-id: "
	#user email-id
			@email_id=gets.chomp
	#user password 
			password=ask("\n\tEnter your password: "){|character| character.echo="*"}
	#call method to encode password
			createHash(password)
	#call method register
			register
	#call method login
			login
		rescue Mysql::Error => e
			puts "Error in connection....#{e}"
		ensure 
			@connection.close if @connection
		end
	end

	def createHash(password)

	#create salt value for password
		salt=SecureRandom.base64(24)
	#using PKCS5 mix password and salt
		pbkdf2=OpenSSL::PKCS5::pbkdf2_hmac_sha1(password,salt,1000,24)
	#encode mixing password
		pbkdf2_encrypt=Base64.encode64(pbkdf2)
	#join string,interation,salt and encode mix password 
		@password=["sha1",1000,salt,pbkdf2_encrypt].join(":")
	end

	def register
	#excute query
		statement=@connection.prepare("insert into login_user values(?,?)")
		statement.execute(@email_id,@password)
		@connection.commit
		puts "\n\tRegister successfully.....!!!"
	end

	def login
		puts "\n\n\tLogin here.....!!!"
		print "\n\tEnter Username: "
	#username of user
		username=gets.chomp
	#password of user
		password=ask("\n\tEnter Password: "){|character| character.echo=false}
	#excute query
		statement1=@connection.prepare("select password from login_user where email_id=?")
		statement1.execute(username)
	#fetch recorde in recordset
		recordset=statement1.fetch
	#check recordset is empty
		if recordset.nil?
			puts "\n\tInvalid Username and Password...!!!"
	#call method login
			login
		else
			password_encrypt=recordset[0]
	#call method matchHash to match password	
			matchHash(password,password_encrypt)
		end
	end

	def matchHash(password,password_encrypt)

	#split join password 
		password_split=password_encrypt.split(":")
	#decode encrypted mix password
		pbkdf2_decrypt=Base64.decode64(password_split[3])
	#mix current password with original salt
		pbkdf2=OpenSSL::PKCS5::pbkdf2_hmac_sha1(password,password_split[2],password_split[1].to_i,pbkdf2_decrypt.length)
	#check current mix password is equal to original mix password
		if pbkdf2.eql? pbkdf2_decrypt
				puts "\n\n\tLogin successfully...!!!\n\n\n"
		else
				puts "\n\tInvalid Username and Password...!!!"
			#call method login
				login
		end
	end
end

Login.new
