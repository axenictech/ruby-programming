class BanksController < ApplicationController
  def index
   
    @laptop = Laptop.find(params[:laptop_id])
    @banks =@laptop.bank.all 
   
  end

  def new
  	@bank = Bank.new
    @laptop = Laptop.find(params[:laptop_id])
  end

  def create 
    @laptop = Laptop.find(params[:laptop_id])
    if @laptop.bank.create(bank_params)
      redirect_to laptops_path
    else
      render 'new'
    end
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
    if @bank.update(bank_params)
      redirect_to laptops_path
    else
      render 'edit'
    end
  end

  def destroy
    # @laptop = Laptop.find(params[:laptop_id])
    @bank = Bank.find(params[:id])
    @bank.destroy
    @laptop=Laptop.all
    redirect_to laptops_path(@laptop)
  end

  private
  def bank_params
  	params.require(:bank).permit(:bname,:baddress,:account_no,:rs)
  end

end
