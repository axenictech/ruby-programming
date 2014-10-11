class PersonalbankinfosController < ApplicationController

  def new
      @bank=Personalbankinfo.new #create object of 'model'
    end

    def index
      @bank=Personalbankinfo.all
    end

  def create
      @bank=Personalbankinfo.new(bank_params)

      if @bank.save #for validation checking for 'not null'
        redirect_to personalinfos_path(@bank) #data stored to DB n page navigated to 'show web page'
      else
        render 'new'
      end
    end
    def index
      @bank=Personalbankinfo.new 
    end

    private
      def bank_params
        params.require(:personalbankinfo).permit(:bank_name,:acc_no,:salary) #DB table name
      end
 
  
end
