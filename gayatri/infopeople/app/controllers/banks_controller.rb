class BanksController < ApplicationController
  def index
   
    @laptop = Laptop.find(params[:laptop_id])
    @banks =@laptop.bank.all 
   
  end

  def new
  	@bank = Bank.new
    @laptop = Laptop.find(params[:laptop_id])
    @banks =@laptop.banks.all 
  end

  def create 
    @laptop = Laptop.find(params[:laptop_id])
    @laptop.banks.create(bank_params)
    @banks =@laptop.banks.all 
  end

  def show
     @laptop = Laptop.find(params[:id])
  #  @bank = Bank.find(params[:id])
  end

  def edit
    #@laptop = Laptop.find(params[:laptop_id])
    @bank = Bank.find(params[:id])

  end 

  def update
    #@laptop = Laptop.find(params[:laptop_id])
    @bank = Bank.find(params[:id])
    @laptop = @bank.laptop
    if @bank.update(bank_params)
      redirect_to new_laptop_bank_path(@laptop)
    else
      render 'edit'
    end
  end 

  def destroy
    #laptop = Laptop.find(params[:laptop_id])
    @bank = Bank.find(params[:id])
    @laptop = @bank.laptop
    @bank.destroy 
    redirect_to new_laptop_bank_path(@laptop)
    #redirect_to new_laptop_bank_path(@laptop)
   
  end

  private
  def bank_params
  	params.require(:bank).permit(:bname,:baddress,:account_no,:rs)
  end

end
