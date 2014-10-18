class BankinfosController < ApplicationController
	def index
		@emp=Personalinfo.find(params[:personalinfo_id]) 
  		@bank=@emp.bankinfos.build
  		@banks=Bankinfo.all
  	end

	def create
		@emp=Personalinfo.find(params[:personalinfo_id]) 
		if @emp.bankinfos.create(bank_params) #for validation checking for 'not null'
  			redirect_to personalinfos_path(@bank) #data stored to DB n page navigated to 'show web page'
  		else
  			render 'index'
  		end
  	end

  	def show 
  		@emp=Personalinfo.find(params[:personalinfo_id])
  		@banks=@emp.bankinfos.all
  	end

  	def edit
  		@bank=Bankinfo.find(params[:id]) #id is default
  	end

  	def update
  		@bank=Bankinfo.find(params[:id])
  	
  		if @bank.update(bank_params) #for validation checking for 'not null'
  			redirect_to personalinfos_path #data stored to DB n page navigated to 'show web page'
  		else
  			render 'edit'
  		end
  	end

  	def destroy
  		@bank=Bankinfo.find(params[:id])
  		@bank.destroy

  		redirect_to personalinfos_path
  	end

  	private
  		def bank_params
  			params.require(:bankinfo).permit(:bank_name,:account_no,:salary) #DB table name
  		end
end