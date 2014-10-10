class BankinfosController < ApplicationController
	def new
  		@bank=Bankinfo.new #create object of 'model'
  	end

	def create
  		@bank=Bankinfo.new(bank_params)

  		if @bank.save #for validation checking for 'not null'
  			redirect_to personalinfos_path(@bank) #data stored to DB n page navigated to 'show web page'
  		else
  			render 'new'
  		end
  	end
  	def index
  		@bank=Bankinfo.new 
  	end

  	private
  		def bank_params
  			params.require(:bankinfo).permit(:bank_name,:account_no,:salary) #DB table name
  		end
end