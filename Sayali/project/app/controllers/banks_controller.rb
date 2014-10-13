class BanksController < ApplicationController
   def create
   	@detail=Detail.find(params[:detail_id])

   	@detail.banks.create(params_bank)
   	redirect_to detail_path(@detail)
   end

   def index
   	@detail=Detail.find(params[:detail_id])
   	
   end

  private 
  def params_bank
   params.require(:bank).permit(:bankName,:accountNo,:salary)
  end

end
