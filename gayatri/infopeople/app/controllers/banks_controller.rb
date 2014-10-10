class BanksController < ApplicationController
  def index
    @banks = Bank.all
  end
  def new
  	@bank = Bank.new
  end

  def create 

    @bank = Bank.new(bank_params)
    if @bank.save
      redirect_to laptops_path
    else
      render 'new'
    end
  end

  def show
    @bank = Bank.find(params[:id])
    
  end

  private
  def bank_params
  	params.require(:bank).permit(:bname,:baddress,:account_no,:rs)
  end

end
