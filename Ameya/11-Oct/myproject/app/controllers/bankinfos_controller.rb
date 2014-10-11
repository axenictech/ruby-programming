class BankinfosController < ApplicationController
	def index
		@emp=Personalinfo.find(params[:personalinfo_id]) 
  		@bank=@emp.bankinfos.build
  	end

	def create
		@emp=Personalinfo.find(params[:personalinfo_id]) 
		if @emp.bankinfos.create(bank_params) #for validation checking for 'not null'
  			redirect_to personalinfos_path(@bank) #data stored to DB n page navigated to 'show web page'
  		else
  			render 'index'
  		end
  	end

  	private
  		def bank_params
  			params.require(:bankinfo).permit(:bank_name,:account_no,:salary) #DB table name
  		end
end