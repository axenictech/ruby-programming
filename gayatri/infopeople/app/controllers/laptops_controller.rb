class LaptopsController < ApplicationController
 
  def index
  	@laptops = Laptop.all
  end

  def welcome
  	@laptop = Laptop.new
  end

  def personinsert
  	@laptop = Laptop.new(laptop_params)
   if @laptop.save
      @laptops = Laptop.all 
  else 
    render 'welcome'
  end

  end
  def show
  	@laptop = Laptop.find(params[:id])
  	
  end
  def edit

  	@laptop = Laptop.find(params[:id])
  	
  end
  def update
  	@laptop =Laptop.find(params[:id])
  	if @laptop.update(laptop_params)
      @laptops = Laptop.all
  	else 
      render 'edit'
    end
 
  end
  def destroy
  	@laptop=Laptop.find(params[:id])
  	#@laptop.bank.destroy_all
    @laptop.destroy
  	redirect_to laptops_path
  end

  private
  def laptop_params
  	params.require(:laptop).permit(:fname,:lname,:address,:age,:email,:phone,:nationality,:bloodgroup,:country)
  end
  
end
